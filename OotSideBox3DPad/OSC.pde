import oscP5.*;
import netP5.*;

OscP5 oscP5 = new OscP5(this,12000);
NetAddress remoteLoc = new NetAddress("127.0.0.1",12000);

void sendOSC(){
  OscMessage mess = new OscMessage("/3dpad");
  mess.add(new int[] {x,y,z,dynX,dynY,dynZ,turnL,turnR});
  oscP5.send(mess,remoteLoc);
}
