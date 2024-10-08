#include <DHT.h>
#include <time.h>
#include <WiFi.h>
#include <PubSubClient.h>

// WiFi (change to the appropriate SSID and Password)
const char *ssid = "SSID";
const char *password = "PASSWORD";

// MQTT Broker
const char *mqtt_broker = "broker.mqtt.cool";
const char *topic = "sic5/group6";
const char *mqtt_username = "";
const char *mqtt_password = "";
const int mqtt_port = 1883;

// Sensor pins
#define DHTPIN 4
#define DHTTYPE DHT11
#define MQ2PIN 32
#define MQ135PIN 34

// NTP Server
const char *ntpServer = "pool.ntp.org";

// Initialize DHT, WiFi, and MQTT client
DHT dht(DHTPIN, DHTTYPE);
WiFiClient espClient;
PubSubClient client(espClient);

void setup() {
  Serial.begin(115200);
  // Connect to WiFi
  setupWiFi();
  // Set MQTT Broker and connect
  client.setServer(mqtt_broker, mqtt_port);
  setupMQTT();
  // Set NTP Server
  configTime(0, 0, ntpServer);
  // Initialize sensors
  dht.begin();
}

void setupWiFi() {
  Serial.println();
  Serial.print("Connecting to ");
  Serial.print(ssid);

  // Set wifi mode as station/client
  WiFi.mode(WIFI_STA);
  // Connect to WiFi network
  WiFi.begin(ssid, password);

  // Waiting ESP32 connect to WiFi
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  randomSeed(micros());
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void setupMQTT() {
  // Loop until reconnected
  while (!client.connected()) {
    Serial.println("Attempting MQTT connection...");
    // Create a random client ID
    String clientId = "ESP32Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    if (client.connect(clientId.c_str(), mqtt_username, mqtt_password)) {
      Serial.println("MQTT connected");
      // resubscribe
      client.subscribe(topic);
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

long getCurrentTime() {
  time_t now;
  struct tm timeinfo;
  if (!getLocalTime(&timeinfo)) {
    // Return 0 if failed to get time
    Serial.println("Failed to obtain time");
    return 0;
  }
  now = time(NULL);
  if (now < 1000000000) {
    // Return 0 if time not valid
    return 0; 
  }
  // Cast to long
  return (long)now;
}

void loop() {
  // Check WiFi connection
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("WiFi disconnected. Attempting to reconnect...");
    setupWiFi();
  }

  // Check MQTT connection
  if (!client.connected()) {
    setupMQTT();
  }
  client.loop();

  // Read sensor values
  float temperature = dht.readTemperature();
  float humidity = dht.readHumidity();
  int mq2_value = analogRead(MQ2PIN);
  int mq135_value = analogRead(MQ135PIN);
  unsigned long timestamp = getCurrentTime();

  mq2_value = map(mq2_value, 0, 4095, 80, 1300);
  mq135_value = map(mq135_value, 0, 4095, 550, 1900);
  
  // Check if any reads failed
  if (isnan(temperature) || isnan(humidity)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  // Print values to serial monitor
  Serial.print("Timestamp: ");
  Serial.print(timestamp);
  Serial.print(" s, Temperature: ");
  Serial.print(temperature);
  Serial.print("°C, Humidity: ");
  Serial.print(humidity);
  Serial.print("%, MQ-2: ");
  Serial.print(mq2_value);
  Serial.print(", MQ-135: ");
  Serial.println(mq135_value);
  
  // Create JSON payload
  char payload[200];
  snprintf(payload, sizeof(payload), "{\"timestamp\":%lu,\"temperature\":%.2f,\"humidity\":%.2f,\"mq2\":%d,\"mq135\":%d}", 
           timestamp, temperature, humidity, mq2_value, mq135_value);
  
  // Publish to MQTT topic with QoS 0
  if (client.publish(topic, payload, true)) {
    Serial.println("Message sent to MQTT broker");
  } else {
    Serial.println("Failed to send message to MQTT broker");
  }

  // Wait for 5 seconds
  delay(5000);
}