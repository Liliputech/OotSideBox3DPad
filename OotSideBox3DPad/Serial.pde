/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

import processing.serial.*;

Serial myPort;
int portIndex=-1;
int counterTrame = 0;
int automateReceive = 0;
private String receivedString;
String rawValues;
String detectedMotion;


void serialEvent(Serial p)
{
  if (myPort.available() > 0)
  {
    char inByte = myPort.readChar();
    processSerial(inByte);
  }
}

void processSerial(char chartmp) {
  
  if( chartmp == '.') print(".");
 
  switch(automateReceive) {
  case 0:
    if (chartmp == '>') automateReceive = 1; 
    break;
    
  case 1:
    if (chartmp == 'A') automateReceive = 2; 
    if (chartmp == 'G') automateReceive = 3; 
    if (chartmp == 'V') {
      automateReceive = 4;
      counterTrame = 0;
      receivedString = "";
    }
  break;
    
   case 2: //etats de l'automate 3Dpad
     print("\n\rState: "); 
     
     switch(chartmp)
     {
           case '0':
           case '1':
                     print("Autocalibration, please wait ...");
                     break;
           case '2':
                     print("Setup ");
                     break;
           case '3':
                     print("Run");
                     break;
     }
     myPort.write('V');   
     automateReceive = 0;
   break;
    
  case 3: //gestures
     print("\n\rGest: "); 
     detectGesture(chartmp);
     automateReceive = 0;
     print(detectedMotion);    
     
  break;
  case 4:
    receivedString += chartmp;
    counterTrame++;
    if (counterTrame == 60) {
      rawValues=receivedString;
      calculateCoord();
      sendOSC();
      //println(rawValues);
      automateReceive = 0;
    }
    break;
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
    detectedMotion = "TurnL : "+ turnL;
    break;
  case '7':
    detectedMotion = "TurnR : " + turnR;
    break;
  case '8':
    detectedMotion = "PUSH";
    break;
  }
}
