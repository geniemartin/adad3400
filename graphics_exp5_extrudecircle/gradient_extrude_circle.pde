int numFrames = 43;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
int x =0;
int y =0;
    
void setup() {
  size(640, 360);
  frameRate(10);
  
  
 
  for (int i = 0; i < numFrames; i++) {
    String imageName = "circle2-" + nf(i, 3) + ".png";
    images[i] = loadImage(imageName);
  }
} 
 
void draw() { 
  //background(0);
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  //int offset = 0;
  //for (int x = -100; x < width; x += images[0].width) { 
   image(images[currentFrame], x, y);
   
   if(x >= 0 && x <= 20){
     x++;
   }
   
   if(y >= 0 && y <= 20){
     y++;
   }

  
}
