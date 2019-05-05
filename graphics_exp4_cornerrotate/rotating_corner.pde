int rotateAngle = 0;
int angleChange = 2;

PImage corner1, corner2;

void setup()
{
  size(500, 500);
  smooth();
  frameRate(60);
  
  imageMode(CENTER);
  corner1 = loadImage("corner1_0.25.png");
  corner2 = loadImage("corner2_0.25.png");
  
}

void draw()
{
  background(255);
  pushMatrix();
  rotateAngle += angleChange;
  popMatrix();

 if (mousePressed){
  pushMatrix();
  translate(200, 200);
  rotate(radians(rotateAngle));
  image(corner1, 0,0);
  popMatrix();
  
  pushMatrix();
  translate(250, 250);
  rotate(radians(-rotateAngle));
  image(corner2, 0,0);
  popMatrix();

  }
}
