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
  //calculate coordinate
  for(int t=0; t< 360; t +=10){
    float radianT = radians(t);
    float x = radius * cos(radianT);
    float y = radius * sin(radianT);
    // draw dot
    stroke(0,128,128);
    strokeWeight(8);
    point(x,y,0);
  }
}
