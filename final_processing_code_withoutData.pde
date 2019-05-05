//ARDUINO
import processing.serial.*; 

Serial myPort;  
String val; //""
int intVal;

//EXTRUDE & GRADIENT VARIABLES

int numFrames = 42;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
int x =100;
int y =100;

//circle2a
//int numFrames1 = 42;  
//int currentFrame1 = 0;
//PImage[] images1 = new PImage[numFrames1];
//int xa =200;
//int ya =150;

//circle2b
//int numFrames2 = 42;  
//int currentFrame2 = 0;
//PImage[] images2 = new PImage[numFrames2];
//int xb =0;
//int yb =0;

//circle2
//int numFrames3 = 42;  
//int currentFrame3 = 0;
//PImage[] images3 = new PImage[numFrames3];
//int xc =0;
//int yc =0;

//circle3a
//int numFrames4 = 42;  
//int currentFrame4 = 0;
//PImage[] images4 = new PImage[numFrames4];
//int xd =0;
//int yd =0;
    
//ROTATION VARIABLES
int rotateAngle = 0;
int angleChange = 3;

//SLIDER VARIABLES
float x1=600; //
float y1=900, y2=324;
int step1 = 1;
int step2 = 1;
int step3 = 1;

//BACKGROUND IMAGE
PImage background_gradient;
PImage circle2a, circle2b, circle2c, circle2d;
PImage circle3a;
PImage corner1, corner2;
PImage circle1, circle2;


void setup(){

  fullScreen();
  //1920,2160 --> 480,540
  //size(480,540);
  background(255);
  smooth();
  frameRate(30);
  imageMode(CENTER);
  
  myPort = new Serial(this, "/dev/cu.usbmodem14122101", 115200);
  myPort.bufferUntil('\n');
  
  //background_gradient = loadImage("background_0.25.png");
  background_gradient = loadImage("background_fullsize.png");
  
  //25% scale base images
  circle2a = loadImage("circle2a.png"); // yellow to blue
  circle2b = loadImage("circle2b.png"); // yellow to purple
  circle2c = loadImage("circle2c.png"); // blue yellow orange
  circle2d = loadImage("circle2d.png"); // blue yellow orange
  
  circle3a = loadImage("circle3a.png"); // blue orange yellow long shape
  
  corner1 = loadImage("corner1.png"); // corner shape w/ yellow & purple
  corner2 = loadImage("corner2.png"); // coner shape w/ yellow & blue
  
  circle1 = loadImage("circle1.png"); // blue to yellow
  circle2 = loadImage("circle2.png"); // blue to yellow
  
  //GRADIENT PIC STRING
  for (int i = 0; i < numFrames; i++) {
    String imageName = "circle2-" + nf(i, 3) + ".png";
    images[i] = loadImage(imageName);
  }
}
//   for (int i = 0; i < numFrames1; i++) {
  //  String imageName1 = "circle2-" + nf(i, 3) + ".png";
//    images1[i] = loadImage(imageName1);
//   }
//   for (int j = 0; j < numFrames2; j++) {
//    String imageName2 = "circle2a-" + nf(j, 3) + ".png";
//     images2[j] = loadImage(imageName2);
//   } 
//   for (int k = 0; k < numFrames3; k++) {
//    String imageName3 = "circle2b-" + nf(k, 3) + ".png";
//    images3[k] = loadImage(imageName3);
//   }
//   for (int l = 0; l < numFrames4; l++) {
//    String imageName4 = "circle3a-" + nf(l, 3) + ".png";
//     images4[l] = loadImage(imageName4); 
//   }
//  }

void serialEvent(Serial myPort){
 val = myPort.readStringUntil('\n');
   if (val!= null){
     val = trim(val); // trims white space

   }

intVal = Integer.parseInt(val);
 println(intVal);

}  

void draw(){
  background_gradient.resize(1080,1920);
  image(background_gradient, 420, height/2);
  
  stroke(255);
  strokeWeight(2);
  
  //ROTATING CORNER1
  pushMatrix();
  rotateAngle += angleChange;
  popMatrix();
  
  drawRotations();
  drawHorizontalSlider();
  drawVerticalSlider1();
  drawVerticalSlider2();
  drawCircle2aGrad();

}

void drawRotations(){
  if (intVal <= 90){ // SHIFT & ROTATE
  pushMatrix();
  translate(250,850);
  image(corner1, 0, 0);  
  popMatrix();
  
  pushMatrix();
  translate(700,600);
  image(corner2, 0,0);
  popMatrix();
  
  }else if (intVal >= 91 && intVal <= 130){ // SHIFT & ROTATE
    
  pushMatrix();
  translate(250,850);
  rotate(radians(rotateAngle));
  image(corner1, 0, 0); 
  popMatrix();
  
  pushMatrix();
  translate(700,600);
  rotate(radians(-rotateAngle));
  image(corner2, 0,0);
  popMatrix();
  
  } else if (intVal >= 131 && intVal <= 160){ // EXTRUDE 3D
  
  pushMatrix();
  translate(250,850);
  image(corner1, 0, 0); 
  popMatrix();
  
  pushMatrix();
  translate(700,600);
  image(corner2, 0,0);
  popMatrix();
  
  } else if (intVal >= 161){ // SHIFT & ROTATE
   
  pushMatrix();
  translate(250,850);
  rotate(radians(rotateAngle));
  image(corner1, 0, 0); 
  popMatrix();
  
  pushMatrix();
  translate(700,600);
  rotate(radians(-rotateAngle));
  image(corner2, 0,0);
  popMatrix();
  
  } 
  
  }
  
void drawHorizontalSlider(){
 image(circle2c, x1, 100); //horizontal orange (TOP)
  
if (intVal <= 90){ // SHIFT & ROTATE
 
    x1+=step1;
    if (x1 > 900) {
      x1 = 900;
      step1 = -1;
    }
    if (x1 < 100) {
      x1 = 100;
      step1 = 1;
    }
    
 } else if (intVal >= 91 && intVal <= 130){ // SHIFT & ROTATE
    x1+=step1;
    if (x1 > width-80) {
      x1 = width-80;
      step1 = -1;
    }
    if (x1 < 80) {
      x1 = 80;
      step1 = 1;
    }
 
 }
}
 
 void drawVerticalSlider1(){
   image(circle2d, 400, y1); // vertical
   
   if (intVal >= 131 && intVal <= 160){ // SHIFT & ROTATE
 
    y1+=step2;
    if (y1 > height-160) {
      y1 = height-160;
      step2 = -1;
    }
    if (y1 < 160) {
      y1 = 160;
      step2 = 1;
    }
    
 } else if (intVal >= 161){ // SHIFT & ROTATE
    y1+=step2;
    if (y1 > height-160) {
      y1 = height-160;
      step2 = -1;
    }
    if (y1 < 160) {
      y1 = 160;
      step2 = 1;
    }
 
 }
 }
 
 void drawVerticalSlider2(){
   image(circle1, width*0.1, y2);
   
      if (intVal <= 90){ // SHIFT & ROTATE
 
    y2+=step3;
    if (y2 > height-200) {
      y2 = height-200;
      step3 = -1;
    }
    if (y2 < 130) {
      y2 = 130;
      step3 = 1;
    }
    
 } else if (intVal >= 91 && intVal <= 130){ // SHIFT & ROTATE
    y2+=step3;
    if (y2 > height-200) {
      y2 = height-200;
      step3 = -1;
    }
    if (y2 < 130) {
      y2 = 130;
      step3 = 1;
    }
 
 }
   
 }
 
 void drawCircle2aGrad(){
   
   image(circle2a, 350, 350); //diagonal
   
  if (intVal >= 91 && intVal <= 130){
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
     image(images[currentFrame], x, y);
   
 //  if(x >= 0 && x <= 20){
 //    x++;
  // }
   
 //  if(y >= 0 && y <= 20){
 //    y++;
 //  }
   
  }
  
  if (intVal >= 160){
    if (intVal >= 91 && intVal <= 130){
      currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
     image(images[currentFrame], x, y);
   
   if(x >= 0 && x <= 20){
     x++;
   }
   
   if(y >= 0 && y <= 20){
     y++;
   }
    }
  }
  }


  
  
 
 
 
   
