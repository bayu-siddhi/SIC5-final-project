import os
import time
import streamlit as st
import plotly.express as px
from helper import Helper
from database import Database
from datetime import datetime
from dotenv import load_dotenv


if __name__ == '__main__':

    load_dotenv()
    AIRI_LOGO = 'images/airi.png'
    DB_TABLE_1 = 'air_quality'
    DB_TABLE_2 = 'articles'
    DB_NAME = str(os.getenv('DB_NAME'))
    DB_HOST = str(os.getenv('DB_HOST'))
    DB_USER = str(os.getenv('DB_USER'))
    DB_PASS = str(os.getenv('DB_PASS'))
    DB_PORT = int(os.getenv('DB_PORT'))
    DB_COLUMNS_1 = ('timestamp', 'temperature', 'humidity', 'mq2', 'mq135', 'category')
    DB_COLUMNS_2 = ('id', 'category', 'title', 'short_desc', 'content', 'image_url', 'published_at')

    db = Database(host=DB_HOST, user=DB_USER, password=DB_PASS, db=DB_NAME, port=DB_PORT)
    st.set_page_config(page_title="Dasbor AIRI", page_icon=AIRI_LOGO, layout="wide")


    # Sidebar
    st.sidebar.image(AIRI_LOGO, width=90)
    st.sidebar.title("Akses Fitur")
    pages = st.sidebar.radio("Pilih Halaman", ["Beranda", "Monitor Kualitas Udara", "Edukasi Kesehatan Anak"])


    # Warna tema
    st.markdown("""
        <style>
        .reportview-container {
            background: #FFFFFF;
            color: #110079;
        }
        .sidebar .sidebar-content {
            background: #800080;
            color: #FFFFFF;
        }
        .stCard {
            border: 1px solid #110079;
            padding: 15px;
            border-radius: 10px;
            background-color: #F8F9FA;
            margin-bottom: 20px;
        }
        .stCard img {
            width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .status-sehat {
            background-color: #d4edda; /* Warna latar belakang hijau muda */
            color: #155724; /* Warna teks hijau gelap */
            padding: 10px;
            border-radius: 5px;
        }
        .status-tidak-sehat {
            background-color: #f8d7da; /* Warna latar belakang merah muda */
            color: #721c24; /* Warna teks merah gelap */
            padding: 10px;
            border-radius: 5px;
        }
        .status-sedang {
            background-color: #fff3cd; /* Warna latar belakang oranye muda */
            color: #856404; /* Warna teks oranye gelap */
            padding: 10px;
            border-radius: 5px;
        }
        .stError, .stWarning, .stSuccess {
            border-radius: 5px;
        }
        .hover-effect:hover {
            opacity: 0.7;
        }
        </style>
        """, unsafe_allow_html=True)


    # Pengaturan auto-refresh
    if "sleep_time" not in st.session_state:
        st.session_state.sleep_time = 5
    if "auto_refresh" not in st.session_state:
        st.session_state.auto_refresh = True

    with st.sidebar.expander("Konfigurasi Dasbor", expanded=True):
        auto_refresh = st.checkbox('Auto Refresh?', st.session_state.auto_refresh)
        if auto_refresh:
            number = st.number_input('Refresh data setiap (n) detik', value=st.session_state.sleep_time)
            st.session_state.sleep_time = number
        st.session_state.auto_refresh = auto_refresh


    # Load data dari database MySQL
    def load_data():
        query = f"SELECT * FROM {DB_TABLE_1} ORDER BY {DB_COLUMNS_1[0]} DESC"
        results = db.fetch_all(query)
        df_results = Helper.air_quality_dataframe(results)
        return df_results


    # Fungsi untuk menghitung status rata-rata
    def calculate_average_status(data):
        if data.empty:
            return "Tidak ada data"
        status_mode = data['category'].mode()[0]
        return status_mode


    # Fungsi untuk menampilkan grafik dan data
    def display_data(data):
        st.title("Dasbor Monitor Kualitas Udara 📈")
        period = st.selectbox("Pilih Periode Data", ["Harian", "Bulanan", "Tahunan"])

        # Input tanggal untuk memilih tanggal tertentu
        if period == "Harian":
            date = st.date_input("Pilih Tanggal", datetime.now().date())
            data_filtered = data[data['timestamp'].dt.date == date]
        elif period == "Bulanan":
            month = st.selectbox("Pilih Bulan", list(range(1, 13)))
            data_filtered = data[(data['timestamp'].dt.month == month) & (data['timestamp'].dt.year == datetime.now().year)]
        elif period == "Tahunan":
            list_of_year = data['timestamp'].dt.year.unique().tolist()
            year = st.selectbox("Pilih Tahun", list_of_year, index=list_of_year.index(max(list_of_year)))
            data_filtered = data[data['timestamp'].dt.year == year]

        # Menampilkan status
        st.write("### Status Terbaru")
        if period == "Harian":
            if not data_filtered.empty:
                latest_data = data_filtered.iloc[0]  # Ambil data terbaru
                latest_timestamp = latest_data['timestamp'].strftime("%d %B %Y pada pukul %H:%M:%S")
                new_status = latest_data['category']
                if new_status == 'TIDAK SEHAT':
                    st.error(f"Terbaru: Kualitas udara pada {latest_timestamp} adalah TIDAK SEHAT. Silakan menuju tab Edukasi Kesehatan Anak untuk rekomendasi.")
                elif new_status == 'SEDANG':
                    st.warning(f"Terbaru: Kualitas udara pada {latest_timestamp} adalah SEDANG. Silakan menuju tab Edukasi Kesehatan Anak untuk rekomendasi.")
                elif new_status == 'BAIK':
                    st.success(f"Terbaru: Kualitas udara pada {latest_timestamp} adalah BAIK. Silakan menuju tab Edukasi Kesehatan Anak untuk rekomendasi.")
            else:
                st.warning("Tidak ada data untuk periode yang dipilih.")
        else:
            if not data_filtered.empty:
                status_average = calculate_average_status(data_filtered)
                if period == 'Bulanan':
                    status_text = f"Sebagian besar kualitas udara pada bulan {month} menghasilkan kategori {status_average}."
                elif period == 'Tahunan':
                    status_text = f"Sebagian besar kualitas udara pada tahun {year} menghasilkan kategori {status_average}."
                
                if status_average == 'TIDAK SEHAT':
                    st.error(status_text)
                elif status_average == 'SEDANG':
                    st.warning(status_text)
                elif status_average == 'BAIK':
                    st.success(status_text)
            else:
                st.warning("Tidak ada data untuk periode yang dipilih.")

        # Menampilkan grafik terpisah
        if not data_filtered.empty:
            st.write("### Grafik Kualitas Udara")
            
            st.write("#### MQ2")
            st.write("Grafik ini menunjukkan perubahan tingkat gas yang terdeteksi oleh sensor MQ-2 (gas mudah terbakar) di udara.")
            fig_mq2 = px.line(data_filtered, x='timestamp', y='mq2', labels={'value': 'MQ2 (ppm)'}, title='Grafik MQ2')
            st.plotly_chart(fig_mq2)

            st.write("#### MQ135")
            st.write("Grafik ini menunjukkan perubahan tingkat gas yang terdeteksi oleh sensor MQ-135 (gas atau asap berbahaya) di udara.")
            fig_mq135 = px.line(data_filtered, x='timestamp', y='mq135', labels={'value': 'MQ135 (ppm)'}, title='Grafik MQ135')
            st.plotly_chart(fig_mq135)
            
            st.write("#### Suhu")
            st.write("Grafik ini menunjukkan perubahan suhu udara dalam ruangan.")
            fig_temp = px.line(data_filtered, x='timestamp', y='temperature', labels={'value': 'Suhu (°C)'}, title='Grafik Suhu')
            st.plotly_chart(fig_temp)

            st.write("#### Kelembapan Udara")
            st.write("Grafik ini menunjukkan perubahan kelembapan udara dalam ruangan.")
            fig_humidity = px.line(data_filtered, x='timestamp', y='humidity', labels={'value': 'Kelembapan (%)'}, title='Grafik Kelembapan Udara')
            st.plotly_chart(fig_humidity)
        
        # Menampilkan data historis
        st.write("### Riwayat Kualitas Udara")
        st.dataframe(data_filtered, hide_index=True)


    # Konten utama
    data = load_data()

    if pages == "Beranda":
        st.title("Selamat Datang di AIRI! 🌟")
        # st.image(AIRI_LOGO, width=90)
        st.write("""
            AIRI hadir dalam menjawab permasalahan maraknya kasus stunting akibat infeksi saluran napas dengan menghadirkan beragam fitur yang terintegrasi dengan IoT dalam memonitoring kondisi dan kualitas udara di rumah serta dilengkapi teknologi machine learning dalam mengklasifikasikan tingkat risiko udara dan memberikan rekomendasi dalam memperbaiki dan meningkatkan kualitas udara di rumah.

            ### Fitur-Fitur AIRI:
            1. **Monitor Kualitas Udara**: Memantau kondisi dan kualitas udara dalam ruangan berdasarkan indikator seperti kelembapan, suhu, serta kadar gas berbahaya.
            2. **Klasifikasi Risiko Kualitas Udara**: Menyediakan penilaian mengenai risiko kualitas udara di rumah, memberikan kategori seperti Sehat, Sedang, dan Tidak Sehat.
            3. **Peringatan**: Memberikan peringatan terkait kualitas udara yang tidak sehat serta tips-tips untuk meningkatkan kualitas udara.
            4. **Konten Edukasi**: Menyediakan artikel edukasi mengenai kesehatan anak, khususnya yang berkaitan dengan infeksi saluran napas dan kualitas udara.
        """)

    elif pages == "Monitor Kualitas Udara":
        display_data(data)

    elif pages == "Edukasi Kesehatan Anak":
        st.title("Artikel Kesehatan Anak ❤️")
        st.write("""
            Dalam menu ini, kami menyediakan berbagai artikel edukasi yang berkaitan dengan kesehatan anak, khususnya yang berhubungan dengan infeksi saluran pernapasan dan kualitas udara di rumah.
        """)
        
        try:
            # Load data artikel dari database
            category = st.selectbox("Pilih Kategori", ["kesehatan", "perawatan"])
            query = f"SELECT * FROM {DB_TABLE_2} WHERE {DB_COLUMNS_2[1]} = %s ORDER BY {DB_COLUMNS_2[6]} DESC"
            articles = db.fetch_all(query, [category])
            articles = Helper.articles_dataframe(articles)

            # Pagination settings
            num_articles_per_page = 8
            num_pages = (len(articles) // num_articles_per_page) + 1

            if "current_page" not in st.session_state:
                st.session_state.current_page = 1

            start_index = 0
            end_index = start_index + num_articles_per_page

            # Display paginated article titles
            paginated_articles = articles.iloc[start_index:end_index].reset_index(drop=True)
            
            selected_title = st.selectbox("Pilih Judul Artikel", paginated_articles['title'].tolist())
            
            if selected_title:
                selected_article = articles[articles['title'] == selected_title].iloc[0]
                st.write(f"### {selected_article['title']}")
                st.write(selected_article['content'])
            
            # Display page navigation
            if num_pages > 1:
                col1, col2 = st.columns([1, 1])
                with col1:
                    if st.session_state.current_page > 1:
                        if st.button("Sebelumnya", use_container_width=True):
                            st.session_state.current_page -= 1
                            st.rerun()
                    else:
                        st.button("Sebelumnya", use_container_width=True, disabled=True)

                with col2:
                    if st.session_state.current_page < num_pages - 1:
                        if st.button("Berikutnya", use_container_width=True):
                            st.session_state.current_page += 1
                            st.rerun()
                    else:
                        st.button("Berikutnya", disabled=True, use_container_width=True)
                        
        except Exception as e:
            st.error("Gagal memuat artikel dari database")

    if st.session_state.auto_refresh:
        time.sleep(st.session_state.sleep_time)
        st.rerun()
