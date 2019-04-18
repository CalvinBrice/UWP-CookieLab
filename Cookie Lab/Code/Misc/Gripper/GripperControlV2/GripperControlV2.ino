
// zoomkat 10-22-11 serial servo test
// type servo position 0 to 180 in serial monitor
// or for writeMicroseconds, use a value like 1500
// for IDE 0022 and later
// Powering a servo from the arduino usually *DOES NOT WORK*.

String readString;
#include <Servo.h> 
Servo servo1;  // create servo object to control a servo 
Servo servo2;  // create servo object to control a servo 

void setup() {
  Serial.begin(9600);
  servo1.writeMicroseconds(1500); //set initial servo position if desired
  servo2.writeMicroseconds(1500); //set initial servo position if desired
  servo1.attach(9);  //the pin for the servo control 
  servo2.attach(10);  //the pin for the servo control 
  Serial.println("servo-test-22-dual-input"); // so I can keep track of what is loaded
}

void loop() {
  while (Serial.available()) {
    char c = Serial.read();  //gets one byte from serial buffer
    readString += c; //makes the string readString
    delay(2);  //slow looping to allow buffer to fill with next character
  }

  if (readString.length() >0) {
    Serial.println(readString);  //so you can see the captured string 
    int n = readString.toInt();  //convert readString into a number

    // auto select appropriate value, copied from someone elses code.
    if(n >= 500)
    {
      Serial.print("writing Microseconds: ");
      Serial.println(n);
      servo1.writeMicroseconds(n);
      servo2.writeMicroseconds(n);
    }
    else
    {   
      Serial.print("writing Angle: ");
      Serial.println(n);
      servo1.write(n);
      servo2.write(n);
    }

    readString=""; //empty for next input
  } 
}
