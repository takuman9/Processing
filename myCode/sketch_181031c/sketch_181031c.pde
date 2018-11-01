void setup(){
  size(960,540,P3D);
}

void draw(){
  background(0,15,30);
  translate(width/2, height/2);
  rotateX(frameCount * 0.005);
  rotateZ(frameCount * 0.005);
  
  //create circle by dot
  float radius = 200;
  //b:create coordinate->Z
  for (int s = 0; s<= 180; s+=10){
    float radianS = radians(s);
    // 0 <= s <= 180 <=> -1 <= cos(radianS) <= 1
    // z = -radius <= z <= radius
    float z = radius * cos(radianS);
    //calculate coordinate
    for(int t=0; t< 360; t +=10){
      float radianT = radians(t);
      // sin(radianS) => 0->1->0
      // radius * sin(radianS) => 0->200->0
      float x = radius * sin(radianS) * cos(radianT);
      float y = radius * sin(radianS) * sin(radianT);
      // draw dot
      stroke(0,128,128);
      strokeWeight(8);
//      point(x,y,0);
      point(x,y,z);
    }
  }
}
