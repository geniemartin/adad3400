int x1=100, y1=100;
int x2=100, y2=100;
int x3=350, y3=100;
int x4=500, y4=100;
int x5=650, y5=100;
int x6=100, y6=300;
int x7=300, y7=300;
int x8=500, y8=300;
int x9=500, y9=250;
int x10=650, y10=300;

int circleWidth=50, circleHeight=50;

void setup(){
  background(200);
  size(800,400);
}


void draw(){
  smooth();
  noStroke();
  fill(240);
  ellipseMode(CENTER);
  
  //CORNER CIRCLE
  ellipse(x1,y1, circleWidth, circleHeight);
  if (x1>99&&x1<150){
    x1++;
  }
  ellipse(x2,y2,circleWidth,circleHeight);
  if(y2>99&&y2<150){
    y2++;
  }
  
  //SINGLE CIRCLE
  ellipse(250, 100, circleWidth, circleHeight);
  
  //DOUBLE CIRCLE
 ellipse(x3, y3, circleWidth, circleHeight);
 ellipse(x3+50,y3, circleWidth, circleHeight);
 
 //DIAGONAL CIRCLE
 ellipse(x4, y4, circleWidth, circleHeight);
 if(x4>499&&x4<550){
   x4++;
 }
 if(y4>99&&y4<150){
   y4++;
 }
  //MEDIUM LONG CIRCLE
  ellipse(x5,y5,circleWidth, circleHeight);
  if(y5>99&&y5<150){
   y5++;
 }
 
 //LONG LONG CIRCLE
 ellipse(x6,y6,circleWidth, circleHeight);
 if(x6>99&&x6<200){
   x6++;
 }
 
 //TRIPLE LINE CIRCLE
 ellipse(x7,y7, circleWidth, circleHeight);
 ellipse(x7+35,y7-35, circleWidth, circleHeight);
 ellipse(x7+70,y7-70, circleWidth, circleHeight);
 
 //LINE WITH CIRCLE
 ellipse(x8,y8,circleWidth, circleHeight);
  if(x8>499&&x8<575){
   x8++;
 }
 ellipse(x9,y9,circleWidth, circleHeight);
 
 //THREE CIRCLE CORNER
 ellipse(x10,y10, circleWidth, circleHeight);
 ellipse(x10+50,y10, circleWidth, circleHeight);
 ellipse(x10,y10-50, circleWidth, circleHeight);

//MOVEMENT SECTION 
if (mousePressed == true&&circleWidth<100&&circleHeight<100) {
 circleWidth++;
 circleHeight++;
  //} else {
    //fill(255);
  //}
  
}
}
