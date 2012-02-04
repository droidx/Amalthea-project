/*arduino code
*/

const int groundpin = 18;             // analog input pin 4 -- ground
const int powerpin = 19;              // analog input pin 5 -- voltage
const int xpin = A3;                  // x-axis of the accelerometer
const int ypin = A2;                  // y-axis
const int zpin = A1;                  // z-axis (only on 3-axis models)
int i=277;


void setup()
{
  // initialize the serial communications:
  Serial.begin(9600);

  // Provide ground and power by using the analog inputs as normal
  // digital pins.  This makes it possible to directly connect the
  // breakout board to the Arduino.  If you use the normal 5V and
  // GND pins on the Arduino, you can remove these lines.
  pinMode(groundpin, OUTPUT);
  pinMode(powerpin, OUTPUT);
  digitalWrite(groundpin, LOW);
  digitalWrite(powerpin, HIGH);
}

int compare(int l)
{
  if((i-l)>5)
  {
    i=l;
    return 1;

  }
  else
  {
    i=l;
    return 0;
  }

}

void loop()
{
  {
    // print the sensor values:
    if(analogRead(xpin)>=275)
      Serial.print(0,BYTE);
    if(analogRead(xpin)<=265)
      Serial.print(1,BYTE);
    if(analogRead(ypin)>=280) 
      Serial.print(2,BYTE);
    if(analogRead(ypin)<=279 && analogRead(ypin)>260)
    {
      if((compare(analogRead(ypin)))==1)
        Serial.print(4,BYTE);
    }
    if(analogRead(ypin)<=260)
      Serial.print(3,BYTE);

    else
      Serial.print(5,BYTE);
    //Serial.print(analogRead(zpin));
    //Serial.println();
    // delay before next reading:
    delay(50);
  }

}

