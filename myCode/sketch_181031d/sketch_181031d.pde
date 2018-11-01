int numPoints = 800;
float[] xPos = new float[numPoints];
float[] yPos = new float[numPoints];
float[] zPos = new float[numPoints];

void setup(){
  size(960,540,P3D);
  // dots random set on the circle create by radius 200px
  for (int i =0; i < numPoints; i++){    
    float radianS = radians(random(180));
    float radianT = radians(random(360));
    xPos[i] = 200 * sin(radianS) * cos(radianT);
    yPos[i] = 200 * sin(radianS) * sin(radianT);
    zPos[i] = 200 * cos(radianS);
  }

}

void draw(){
  background(0,15,30);
  
  translate(width/2, height/2);
  rotateX(frameCount * 0.005);
  rotateZ(frameCount * 0.005);
  
  for (int i = 0; i< numPoints; i++){
      stroke(0,128,128);
      strokeWeight(8);
      point(xPos[i],yPos[i],zPos[i]);
  }
}
