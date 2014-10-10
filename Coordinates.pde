/*
Based on an original idea from OotSideBox
Demo software written by Liliputech
*/

int x, y, z;
int dynX, dynY, dynZ;
int turnL, turnR;

void calculateCoord() {
      //En VB les tableau commencent à 1, en processing à 0,
      //donc tous les indices sont +1 ;)
      int rawx = int(rawValues.substring(22, 25));
      int rawy = int(rawValues.substring(27, 30));
      int rawz = int(rawValues.substring(32, 35));
      int rawDynX = int(rawValues.substring(37, 40));
      int rawDynY = int(rawValues.substring(42, 45));
      int rawDynZ = int(rawValues.substring(47, 50));
      
      //petit changement de coordonnées nécessaire au bon affichage dans processing
      x = rawx*width/100;
      y = (100-rawy)*height/100;
      z = rawz;
      
      dynX = rawDynX*width/100;
      dynY = (100-rawDynY)*height/100;
      dynZ = rawDynZ;
      
      turnL = int(rawValues.substring(52, 55));
      turnR = int(rawValues.substring(57, 60));
}
