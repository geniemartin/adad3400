PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12;
PImage img13, img14, img15, img16, img17, img18, img19, img20, img21, img22;

float x=3;
float y=3;

void setup(){
//fullScreen();
//1280,960 --> 480,640
size(480,640);
background(255);
img1 = loadImage("Asset 93xxhdpi.png");
img2 = loadImage("Asset 94xxhdpi.png");
img3 = loadImage("Asset 95xxhdpi.png");
img4 = loadImage("Asset 96xxhdpi.png");
img5 = loadImage("Asset 97xxhdpi.png");
img6 = loadImage("Asset 98xxhdpi.png");
img7 = loadImage("Asset 99xxhdpi.png");
img8 = loadImage("Asset 100xxhdpi.png");
img9 = loadImage("Asset 101xxhdpi.png");
img10 = loadImage("Asset 102xxhdpi.png");
img11 = loadImage("Asset 103xxhdpi.png");
img12 = loadImage("Asset 104xxhdpi.png");
img13 = loadImage("Asset 105xxhdpi.png");
img14 = loadImage("Asset 106xxhdpi.png");
img15 = loadImage("Asset 107xxhdpi.png");
img16 = loadImage("Asset 108xxhdpi.png");
img17 = loadImage("Asset 109xxhdpi.png");
img18 = loadImage("Asset 110xxhdpi.png");
img19 = loadImage("Asset 111xxhdpi.png");
img20 = loadImage("Asset 112xxhdpi.png");
img21 = loadImage("Asset 113xxhdpi.png");
img22 = loadImage("Asset 114xxhdpi.png");


}

void draw(){
  image(img1, x-x, y-y);
  image(img2, x, y);
  image(img3, 2*x, 2*y);
  image(img4, 3*x, 3*y);
  image(img5, 4*x, 4*y);
  image(img6, 5*x, 5*y);
  image(img7, 6*x, 6*y);
  image(img8, 7*x, 7*y);
  image(img9, 8*x, 8*y);
  image(img10, 9*x, 9*y);
  image(img11, 10*x, 10*y);
  image(img12, 11*x, 11*y);
  image(img13, 12*x, 12*y);
  image(img14, 13*x, 13*y);
  image(img15, 14*x, 14*y);
  image(img16, 15*x, 15*y);
  image(img17, 16*x, 17*y);
  image(img18, 17*x, 17*y);
  image(img19, 18*x, 18*y);
  image(img20, 19*x, 19*y);
  image(img21, 20*x, 20*y);
  image(img22, 21*x, 21*y);
  

  
}
