/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

import processing.serial.*;

Serial myPort;
int portIndex=Serial.list().length;
int counterTrame = 0;

private String receivedString;
String rawValues;
String detectedMotion;

void setupSerial() {
  if (portIndex != dSerial.getValue()) {
    portIndex = int(dSerial.getValue());
    myPort = new Serial(this, Serial.list()[portIndex], 115200);
    println("connect to -> " + Serial.list()[portIndex]);
  }
}

void serialEvent(Serial p)
{
  if (myPort.available() > 0)
  {
    char inByte = myPort.readChar();
    processSerial(inByte);
  }
}

void processSerial(char chartmp) {
  int automateReceive = 0;
  switch(automateReceive) {
  case 0:
    if (chartmp == '>') automateReceive = 1; 

  case 1:
    if (chartmp == 'A') automateReceive = 2; 
    //    if (chartmp == 'G') automateReceive = 3; 
    if (chartmp == 'V') {
      automateReceive = 4;
      counterTrame = 0;
      receivedString = "";
    }

    //Petits problèmes avec la detection de mouvement...
    /*
  case 3:
     detectGesture(chartmp);
     automateReceive = 0;
     println(detectedMotion);    
     */

  case 4:
    receivedString += chartmp;
    counterTrame++;
    if (counterTrame == 60) {
      rawValues=receivedString;
      calculateCoord();
      println(rawValues);
    }
    automateReceive = 0;
  }
}

void detectGesture(char chartmp) {
  switch(chartmp) {
  case '0':
    detectedMotion = "OUT";
    break;
  case '1':
    detectedMotion = "IN";
    break;
  case '2':
    detectedMotion = "RIGHT";
    break;
  case '3':
    detectedMotion = "LEFT";
    break;
  case '4':
    detectedMotion = "UP";
    break;
  case '5':
    detectedMotion = "DOWN";
    break;
  case '6':
    detectedMotion = "TurnL";
    break;
  case '7':
    detectedMotion = "TurnR";
    break;
  case '8':
    detectedMotion = "PUSH";
    break;
  }
}


