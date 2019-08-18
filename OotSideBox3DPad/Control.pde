/*
Based on an original idea from OotSideBox
 Demo software written by Liliputech
 */

import processing.serial.*;
import controlP5.*;
ControlP5 cp5;
ScrollableList dSerial;
Button bCalibrate, bSetup;

void setupControl() {
  cp5 = new ControlP5(this);

  bCalibrate = cp5.addButton("Calibrate")
    .setValue(0)
    .setPosition(10, 30)
    .setColorBackground(color(60))
    .setColorActive(color(255, 128));

  bSetup = cp5.addButton("Setup")
    .setValue(0)
    .setPosition(10, 50)
    .setColorBackground(color(60))
    .setColorActive(color(255, 128));

  dSerial = cp5.addScrollableList("PortList")
    .setPosition(10, 20)
    .setCaptionLabel("Connect")
    .setColorBackground(color(60))
    .setColorActive(color(255, 128));

  for (int i=0; i<Serial.list ().length; i++) {
    dSerial.addItem(Serial.list()[i], i);
  }
}

public void PortList(int portIndex) {
  println(portIndex);
  if (portIndex < 0) return;
  println("3Dpad connecting to -> " + Serial.list()[portIndex]);
  myPort = new Serial(this, Serial.list()[portIndex], 115200);
}

public void Calibrate() {
  if (portIndex < 0) return;
  println("calibrate...");
  myPort.write('A');
}

public void Setup() {
  if (portIndex < 0) return;
  println("setup...");
  myPort.write('S');
}
