import os
import json
import pytz
import pickle
import pandas as pd
import paho.mqtt.client as mqtt
from dotenv import load_dotenv
from database import Database
from datetime import datetime


class MQTT:

    def __init__(self, broker: str, port: int, topic: str, keep_alive: int, db: Database, model):
        self.broker = broker
        self.port = port
        self.topic = topic
        self.keep_alive = keep_alive

        self.client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2)
        self.client.on_connect = self.__on_connect
        self.client.on_message = self.__on_message
        self.client.connect(broker, port, keep_alive)

        self.db = db
        self.DB_TABLE = 'air_quality'
        self.DB_COLUMNS = ('timestamp', 'temperature', 'humidity', 'mq2', 'mq135', 'category')
        
        self.model = model
        self.AIR_QUALITY = ['BAIK', 'SEDANG', 'TIDAK SEHAT']
    
    def __on_connect(self, client, userdata, flags, reason_code, properties):
        print(f"Connected to MQTT broker with result code: {reason_code}")
        client.subscribe(self.topic)

    def __on_message(self, client, userdata, msg):
        # print(msg.topic)
        payload = json.loads(msg.payload)
        print(f"[INFO] Successfully received MQTT data: {payload}")

        time = float(payload['timestamp'])
        temperature = float(payload['temperature'])
        humidity = float(payload['humidity'])
        mq2 = int(payload['mq2'])
        mq135 = int(payload['mq135'])

        # Change seconds to local datetime
        timestamp = datetime.fromtimestamp(time, tz=pytz.timezone('Asia/Jakarta'))
        timestamp = timestamp.strftime('%Y-%m-%d %H:%M:%S')

        # Perform classification using machine learning
        feature = pd.DataFrame([{'mq2': mq2, 'mq135': mq135}])
        category = self.AIR_QUALITY[self.model.predict(feature)[0]]
        print(f"[INFO] Successfully classified air quality as: {category}")

        # Store the data to database
        insert_query = f"INSERT INTO {self.DB_TABLE} ({', '.join(self.DB_COLUMNS)}) VALUES (%s, %s, %s, %s, %s, %s)"
        self.db.insert(insert_query, (timestamp, temperature, humidity, mq2, mq135, category))
        print('[INFO] Successfully sent data to the database')


if __name__ == '__main__':

    load_dotenv()
    DB_NAME = str(os.getenv('DB_NAME'))
    DB_HOST = str(os.getenv('DB_HOST'))
    DB_USER = str(os.getenv('DB_USER'))
    DB_PASS = str(os.getenv('DB_PASS'))
    DB_PORT = int(os.getenv('DB_PORT'))
    MQTT_BROKER = str(os.getenv('MQTT_BROKER'))
    MQTT_PORT = int(os.getenv('MQTT_PORT'))
    MQTT_TOPIC = str(os.getenv('MQTT_TOPIC'))
    MQTT_KEEP_ALIVE = int(os.getenv('MQTT_KEEP_ALIVE'))
    CLASSIFICATION_MODEL = str(os.getenv('CLASSIFICATION_MODEL'))

    with open(f"{CLASSIFICATION_MODEL}", "rb") as f:
        model = pickle.load(f)

    db = Database(host=DB_HOST, user=DB_USER, password=DB_PASS, db=DB_NAME, port=DB_PORT)
    mqtt = MQTT(MQTT_BROKER, MQTT_PORT, MQTT_TOPIC, MQTT_KEEP_ALIVE, db, model)

    try:
        mqtt.client.loop_forever()
    except KeyboardInterrupt:
        pass
