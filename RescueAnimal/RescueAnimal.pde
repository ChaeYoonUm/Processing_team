PImage img;
float xp,yp;

void setup(){
size(1600,900);
// loadPixels();
img=loadImage("bg.png");
xp=0;
yp=0;
}

void draw(){
 image(img,-xp,-yp);
 println(xp,yp);
 // println(img.width);

 img.loadPixels();
 for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = (int)xp + x + ((int)yp + y) * img.width;
      // red(), green(), and blue() get the three color      // components from a pixel.
      float r = red(img.pixels [loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, the lower the distance
      // We want closer pixels to be brighter, so we invert the value u      // using map(). Pixels with a distance >= 50 are completely dark.
      // Pixels with a distance of 0 have a brightness of 1.0.
      float adjustBrightness = map(distance, 0, 200, 1, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

   // The RGB values are constrained between 0 and 255.
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Set the display pixel to the image pixel
      img.pixels[loc] = color(r, g, b);
    }
  }

  img.updatePixels();
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
