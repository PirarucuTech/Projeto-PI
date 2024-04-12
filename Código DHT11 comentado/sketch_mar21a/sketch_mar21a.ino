# include "DHT.h"
# define dht_type DHT11

int dht_pin = A1;
DHT dht_1 = DHT(dht_pin, dht_type); // definição de variaveis

void setup() { // codigo que roda uma vez só
Serial.begin(9600);
dht_1.begin();
}

void loop() { // codigo que roda diversas vezes
float umidade = dht_1.readHumidity(); // variavel de leitura - umidade
umidade = umidade * 1; // simulação de umidade
float temperatura = dht_1.readTemperature(); // variavel de leitura - temperatura
temperatura = temperatura * 1; // simulação de temperatura
if(isnan(temperatura) or isnan(umidade)){
Serial.println("Erro ao ler");
} else {

Serial.print(umidade);
Serial.print(","); //


Serial.println(temperatura);

}
delay(500);
}