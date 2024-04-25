#include "DHT.h"
#define dht_type DHT11

int dht_pin = A1;
DHT dht_1 = DHT(dht_pin, dht_type); // definição de variaveis

void setup() { // codigo que roda uma vez só
  Serial.begin(9600);
  dht_1.begin();
}

void loop() { // codigo que roda diversas vezes
  float umidade = dht_1.readHumidity(); // variavel de leitura - umidade
  float temperatura = dht_1.readTemperature(); // variavel de leitura - temperatura
  float FK = 1;
  float umidade2 = umidade * 1.1;
  float temperatura2 = temperatura * 1.1;
  float FK2 = 2;
  float umidade3 = umidade * 0.9;
  float temperatura3 = temperatura * 0.9;
  float FK3 = 3;
  if(isnan(temperatura) or isnan(umidade)){
    Serial.println("Erro ao ler");  // caso haja erro de leitura, printa na tela
  } else {
    Serial.print(umidade);
    Serial.print(";"); // 
    Serial.print(temperatura);
    Serial.print(";");
    Serial.print(FK);
    Serial.println(";");
    Serial.print(umidade2);
    Serial.print(";"); // 
    Serial.print(temperatura2);
    Serial.print(";");
    Serial.println(FK2);
    Serial.print(umidade3);
    Serial.print(";"); // 
    Serial.print(temperatura3);
    Serial.print(";");
    Serial.println(FK3);
  }
  delay(500);
}