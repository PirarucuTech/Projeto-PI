#include "DHT.h" // biblioteca do dht
#define dht_type DHT11 // definição de tipo de dht, ou seja, dht11

int dht_pin = A1;
DHT dht_1 = DHT(dht_pin, dht_type); // definição de variaveis

void setup() { // codigo que roda uma vez só
  Serial.begin(9600); // velocidade do monitor serial
  dht_1.begin();
}

void loop() { // codigo que roda diversas vezes
  float umidade = dht_1.readHumidity(); // variavel de leitura - umidade
  float temperatura = dht_1.readTemperature(); // variavel de leitura - temperatura
  int FK = 3500; // variavel da foreign key do banco de dados  
  float umidade2 = umidade * 1.1; // variavel de simulação da umidade
  float temperatura2 = temperatura * 1.1; // variavel de simulação da temperatura
  int FK2 = 3501; // variavel da foreign key do banco de dados de exemplo
  float umidade3 = umidade * 0.9; // variavel de simulação da umidade
  float temperatura3 = temperatura * 0.9; // variavel de simulação da temperatura
  int FK3 = 3502; // variavel da foreign key do banco de dados de exemplo

  if(isnan(temperatura) or isnan(umidade)){
    Serial.println("Erro ao ler");  // caso haja erro de leitura, printa na tela
  } else {
    Serial.print(umidade); // valor de umidade captados pelo sensor
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.print(temperatura); // valor de temperatura captados pelo sensor
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.println(FK); // Foreign key do banco de dados, da tabela do sensor
    Serial.print(umidade2); // valor de umidade captados pelo sensor de exemplo
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.print(temperatura2); // valor de temperatura captados pelo sensor de exemplo
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.println(FK2); // Foreign key do banco de dados, da tabela do sensor de exemplo
    Serial.print(umidade3); // valor de umidade captados pelo sensor de exemplo
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.print(temperatura3); // valor de temperatura captados pelo sensor de exemplo
    Serial.print(";"); // separação dos valores para interpretação da api
    Serial.println(FK3); // Foreign key do banco de dados, da tabela do sensor de exemplo
  }
  delay(10000); // delay de 30 segundos para cada leitura
}
