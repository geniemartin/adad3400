#include <NewPing.h>
 
#define TRIGGER_PIN  8
#define ECHO_PIN     7
#define MAX_DISTANCE 250


//const int lowDist = 10;
 
NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);
 
void setup(){
  Serial.begin(115200);

}
 
void loop(){
 delay(200);
  int uS = sonar.ping(); 
  //Serial.print("Ping: ");
  Serial.println(uS / US_ROUNDTRIP_CM); // convert ping time to distance in cm
  //Serial.println("cm");


}
