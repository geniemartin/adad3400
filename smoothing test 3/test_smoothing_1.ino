int sensorReading = 0;
int pauseTime = 1000;
int readings[10];
int total = 0;
int average = 0;
int numReadings = 0;
int index = 0;

int outputVal = 0;

int minVal = 1000;
int maxVal = 0;

int calibrated = 0;

int time = 0;

int smallest = 0;
int largest = 0;

void setup() {
Serial.begin(9600);
pinMode(7, OUTPUT);
//pinMode(13, OUTPUT);

for (int i = 0; i < 10; i++) {
readings[i] = 0;
}

}

void loop() {
sensorReading = analogRead(0);

if (millis() < 4000) {
digitalWrite(11, HIGH);
if (sensorReading < minVal) {
minVal = sensorReading;
}
if (sensorReading > maxVal) {
maxVal = sensorReading;
}
} else {
digitalWrite(11, LOW);
calibrated = 1;
}

if (calibrated > 0) {
total = 0;

smallest = 5000;
largest = 0;

if (numReadings < 10) {
numReadings += 1;
}
index+=1;
if (index >= 10) {
index = 0;
}

readings[index] = sensorReading;

for (int i = 0; i < numReadings; i++) {
if (readings[i] < smallest) {
smallest = readings[i];
}
if (readings[i] > largest) {
largest = readings[i];
}

total += readings[i];
}

total -= (smallest + largest);

for (int i = 0; i < numReadings; i++) {
int temp = 0;
temp = readings[i];
//Serial.print(“Reading[i]: “);
//Serial.println(temp);
}

//Serial.print(“largest: “);
//Serial.println(largest);
//Serial.print(“smallest: “);
//Serial.println(smallest);
//Serial.print(“\n”);

average = total/(numReadings-2);

outputVal = map(average, minVal, maxVal, 0, 255);
if (outputVal < 10) {
outputVal = 0;
}
analogWrite(7, outputVal);

Serial.print(“Sensor: “);
Serial.print(sensorReading);
Serial.print(” avg: “);
Serial.println(average);
//Serial.print(“\n”);
Serial.print(“outputVal: “);
Serial.print(outputVal);
Serial.print(“\n\n”);

//delay(1000);
}

}
