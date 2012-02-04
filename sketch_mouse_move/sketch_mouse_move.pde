import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;
import processing.serial.*;
import java.awt.event.*;

int x = 10, y = 10;
Robot robby;

Serial myPort; // Create object from Serial class
int val; // Data received from the serial port
int iter;
int xc=0,yc=0,d;

void setup(){
size(1280,800);
colorMode(RGB,1.0);
String portName = Serial.list()[0];
myPort = new Serial(this, portName, 9600);
try
  {
    robby = new Robot();
  }
  catch (AWTException e)
  {
    println("Robot class not supported by your system!");
    exit();
  }
}

void draw()
{
if ( myPort.available() > 0) { // If data is available,
val = myPort.read(); // read it and store it in val
}
background(255); // Set background to white
//d=5;
//x=xc;
//y=yc;
if(y<=(height-5))
{
if(val==3)
{
for(iter=0;iter<3;iter++)
{
y=(y+1);
robby.mouseMove(x, y);
}
}
}
if(val==2)
{
for(iter=0;iter<3;iter++)
{
y=(y-1);
robby.mouseMove(x, y);
}
}

if(x<=(width-5))
{
if(val==1)
{
for(iter=0;iter<3;iter++)
{
x=(x+1);
robby.mouseMove(x, y);
}
}
}
if(val==0)
{
  for(iter=0;iter<3;iter++)
  {
  x=(x-1);
  robby.mouseMove(x, y);
}
}

if(val==4)
{
robby.mousePress(InputEvent.BUTTON1_MASK);
robby.mouseRelease(InputEvent.BUTTON1_MASK);
robby.delay(300);
}
else
robby.mouseMove(x, y);

myPort.clear();
// if(keyCode==ENTER)
// d=10;
//rect(xc,yc,d,d);
}
