int circleWidth=20;
int circleHeight=20;

int x1=100;
int y1=100;

void setup(){
  background(200);
  size(800,600);
  frameRate(60);
}
void draw(){
  smooth();
  noStroke();
  fill(240);
  ellipseMode(CENTER);
  
  ellipse(x1,y1,circleHeight,circleWidth);
  
  if (x1>99&&x1<700){
    x1++;
  }
  if(x1>699){
    y1++;
  }
  if(y1>300){
    y1=301;
    x1=x1-2;
  }
  if(x1<98){
    x1=98;
    y1++;
  }
  println(y1);

if (mousePressed == true&&circleWidth<100&&circleHeight<100) {
 circleWidth++;
 circleHeight++;
  } else {
 circleWidth--;
 circleHeight--;
}
}
