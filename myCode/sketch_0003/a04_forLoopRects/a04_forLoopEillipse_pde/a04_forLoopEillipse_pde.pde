size(800,600);

int i;
width =  800;
height = 600;

float diameter = height;

background(0);
noStroke();
fill(0,127,255,40);

for(i=0; i<32; i=i++){
  ellipse(width /2, height/ 2, diameter,diameter);
  diameter = diameter / 1.214;
}
