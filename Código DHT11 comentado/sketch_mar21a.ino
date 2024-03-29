//instalei a biblioteca de DHT11 disponibilizada pelo Arduino IDE e o seu autor é o Adafruit  
#include "DHT.h" //incluindo a biblioteca DHT
#define dht_type DHT11 //declarando com uma variável o tipo do sensor DHT usado (DHT11)

int dht_pin = A0; //declarando a variável do pino A0 
DHT dht_1 = DHT(dht_pin, dht_type); //mesclando as duas variáveis em uma só chamada dht_1 

void setup() { //dando inicio
  Serial.begin(9600);//iniciando monitor serial 
  dht_1.begin();//iniciando o dht
}

void loop() { //entrando no loop e na repetição 
  float umidade = dht_1.readHumidity(); // criando a variável umidade para captar a umidade do ambiente sendo float para ter números depois da virgula 
  float temperatura = dht_1.readTemperature(); //criando a variável temperatura para captar a temperatura da água 
  if(isnan(temperatura) or isnan(umidade)){ //evitando erros caso capte algo que não seja a temperatura ou a umidade
    Serial.println("Erro ao ler"); // se esse erro for indentificado ele gera essa mensagem no monitor serial
  } else { //caso não haja erro
    Serial.print("Umidade: ");//exibe isso junto ao valor da umidade 
    Serial.print(umidade);
    Serial.print(" % ");
    Serial.print(" Temperatura: ");//exibe isso junto ao valor da temperatura
    Serial.print(temperatura);
    Serial.println(" ºC");
  }
  delay(2000);// delay de 2 segundos para o void loop recomeçar 
}
