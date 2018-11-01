void setup(){
 size(800,800, P3D);
 frameRate(60);
 smooth();
 fill(0,127,255);
 noStroke();
 strokeWeight(2.0);
 rectMode(CENTER);
}

void draw(){
 background(0);
 lights();
 translate(width/2, height/2);
 rotateX(frameCount / 50.0);
 rotateY(frameCount / 64.0);
 rotateZ(frameCount / 68.0);
 box(300);
}
