size(800,600);
float w,h;
w = width;
h = height;

background(0);
stroke(0);
//fill(random(255),random(255),random(255),100);

for (int i = 0; i<32; i++){
  fill(random(255),random(255),random(255),100);
  w = w/2;
  h = h/2;
  rect(0,0,w,h);
  rect(w,h,w,h);
}
