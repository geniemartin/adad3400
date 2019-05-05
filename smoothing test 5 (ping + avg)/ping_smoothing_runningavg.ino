#include <NewPing.h>

#define TRIGGER_PIN 8 // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN 7 // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 200 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.

int led = 13;
NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

const int numReadings = 10;
int readings[numReadings]; // the readings from the analog input
int readIndex = 0; // the index of the current reading
int total = 0; // the running total
int average = 0; // the average

//int inputPin = 12;

void setup() {
Serial.begin(9600); // Open serial monitor at 115200 baud to see ping results.
pinMode(led, OUTPUT);

// Serial.println(analogRead(11));
// delay(2);

for (int thisReading = 0; thisReading < numReadings; thisReading++)
readings[thisReading] = 0;
}

void loop() {
delay(50); // Wait 50ms between pings (about 20 pings/sec). 29ms should be the shortest delay between pings.
unsigned int uS = sonar.ping(); // Send ping, get ping time in microseconds (uS).
// Serial.print(“Ping: “);
float pang = uS / US_ROUNDTRIP_CM;
// Serial.println(pang); // Convert ping time to distance in cm and print result (0 = outside set distance range)
// Serial.println(“”);

total = total - readings[readIndex];
// read from the sensor:
readings[readIndex] = pang;
// add the reading to the total:
total= total + readings[readIndex];
// advance to the next position in the array:
readIndex = readIndex + 1;

// if we’re at the end of the array…
if (readIndex >= numReadings)
// …wrap around to the beginning:
readIndex = 0;

// calculate the average:
average = total / numReadings;
// send it to the computer as ASCII digits
Serial.println(average);
delay(1); // delay in between reads for stability

float av = map(average, 0, 30, 0, 255);

if (average >= 0) {
analogWrite(led, av);
delay(av);
analogWrite(led, 0);
}
// else {
// analogWrite(led, 0);
// }
}
