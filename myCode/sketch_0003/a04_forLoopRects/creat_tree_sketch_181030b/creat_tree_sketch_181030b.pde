float trunkLength = 260;     // 最初の幹の長さ
float trunkThickness = 70;   // 最初の幹の太さ
int maxPoints = 50;          // 最大の点の数
int lengthLimit = 120;       // 距離制限
int hueColor;
color bgColor;
boolean save = false;

void setup(){
  size(displayWidth, displayHeight, P2D);
  smooth(32);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  noLoop();
  reset();
}

void reset(){
  hueColor = int(random(360));
  bgColor = color(hueColor, 80, 15);
}

void draw(){
  if(!save){
    background(bgColor);
    translate(width/2, height);
    branch(trunkLength, trunkThickness);
  }
  
  if(save){
    saveFrame("img/img-"+(int)random(10000)+".jpg");
    save = false;
  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    reset();
    redraw();
  }
  else if(mouseButton == RIGHT){
    save = true;
    redraw();
  }
}

void branch(float tl, float th){
  // 幹が長いほど点の数を多くする
  int n = (int)map(tl, 5, trunkLength, 5, maxPoints);
  Point[] points = new Point[n];
  for(int i = 0; i < n; i++){
    points[i] = new Point(tl, th);
  }
  // 全ての点が他の全ての点に対して距離を計算し、lengthLimit以内にある点を保存
  for(int i = 0; i < n; i++){
    Point fromP = points[i];
    ArrayList<Point> nearPs = new ArrayList<Point>();
    for(int j = 0; j < n; j++){
      if(i == j) continue;
      Point toP = points[j];
      float dist = dist(fromP.x, fromP.y, toP.x, toP.y);
      if(dist < lengthLimit){
        nearPs.add(toP);
      }
    }
    // 多角形を描画
    fill(fromP.col);
    beginShape();
    for(Point p : nearPs){
      vertex(p.x, -p.y);
    }
    endShape(CLOSE);
  }
  // 描画位置を移動
  translate(0, -tl);
  // 幹の長さと太さを縮める
  tl *= random(0.70, 0.80);
  th *= random(0.50, 0.80);
  // 幹の長さが５以上なら
  if(tl > 5){
    // 右方向の分岐
    pushMatrix();
    rotate(radians(random(15, 45)));
    branch(tl, th);
    popMatrix();
    if(random(1) < 0.3){
      pushMatrix();
      rotate(radians(random(15, 45)));
      branch(tl, th);
      popMatrix();
    }
    if(random(1) < 0.15){
      pushMatrix();
      rotate(radians(random(15, 45)));
      branch(tl, th);
      popMatrix();
    }
    // 左方向の分岐
    pushMatrix();
    rotate(radians(random(-45, -15)));
    branch(tl, th);
    popMatrix();
    if(random(1) < 0.3){
      pushMatrix();
      rotate(radians(random(-45, -15)));
      branch(tl, th);
      popMatrix();
    }
    if(random(1) < 0.15){
      pushMatrix();
      rotate(radians(random(-45, -15)));
      branch(tl, th);
      popMatrix();
    }
  }
}

class Point{
  float x, y;
  color col;
  
  Point(float tl, float th){
    // 縦tl+tl/3ピクセル、横thピクセルの長方形の中にランダムで点を配置
    x = random(th);
    y = random(tl+tl/4); // 幹と幹の境界をぼやけさせるためにtl/3を足す
    col = color(hueColor+random(-60, 60), random(100), 5);
  }
}
