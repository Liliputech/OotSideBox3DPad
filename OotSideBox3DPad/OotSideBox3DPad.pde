/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

void setup()
{
  size(500, 500);
  if (frame != null) frame.setResizable(true);
  println("3Dpad>");
  setupControl();
} 

void draw()
{
  background(0);
  fill(0, 255, 0);
  
  noStroke();
  
  if (z<250)
   {
    if (z > 40) ellipse(x, y, z, z);
    else ellipse(x, y, 40, 40);
    
    fill(153);
    ellipse(dynX, dynY, 10, 10);
    
    
    stroke(255);
    line(dynX,dynY,x,dynY);
    line(dynX,dynY,dynX,y);
  }
}

void keyPressed() 
{
  print("\n\rKeyboard -> "+key);
  print("\n\r");
  myPort.write(key);
}
