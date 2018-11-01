size(400,400);

int i;
float rectSize = 200;

for(i=0; i<10; i=i++){
  rect(100,100,rectSize,rectSize);
  rectSize = rectSize/1.732;
}
