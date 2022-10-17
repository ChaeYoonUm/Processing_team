PImage img;
float xp,yp;
float minBrightness;
Crab c;

void setup(){
size(1600,900);
// loadPixels();
img=loadImage("bg.png");
xp=0;
yp=0;
minBrightness=0;
c = new Crab(100, 100);
}

void draw(){
  img.loadPixels();
  loadPixels();

  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int locBG = (int)xp + x + ((int)yp + y) * img.width;
      int loc = x + y * width;

      pixels[loc] = img.pixels[locBG];
    }
  }

  updatePixels();


  c.drawAnimal();
  loadPixels();


  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int loc = x + y * width;

      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);

      float distance = dist(x, y, mouseX, mouseY);

      float adjustBrightness = map(distance, 0, 250, 1, minBrightness);

      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
     yp-=100;
    }else if(keyCode==DOWN){
     yp+=100;
    }else if(keyCode==LEFT){
     xp-=100;
    }else if(keyCode==RIGHT){
     xp+=100;
    }
  }
   xp=constrain(xp,0,8000);
 yp=constrain(yp,0,4500);
}

void mousePressed() {
  // if(value == 0) {
    minBrightness += 1/8f;
    minBrightness = constrain(minBrightness, 0, 1);
    println(minBrightness);
  // }
}
