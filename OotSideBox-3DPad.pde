/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

void setup()
{
  size(800, 400);
  println("3Dpad>");
  setupControl();
} 

void draw()
{
  background(0);
  setupSerial();
  fill(255);noStroke();
  ellipse(x, y, z, z);
  fill(0, 0, 255);
  ellipse(dynX, dynY, 20, 20);
  stroke(0,255,0);
  line(dynX,dynY,x,dynY);
  line(dynX,dynY,dynX,y);
}




void keyPressed() 
{
  print("\n\rKeyboard -> "+key);
  myPort.write(key);
}
