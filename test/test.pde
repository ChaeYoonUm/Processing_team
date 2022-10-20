// PImage img;
//
// void setup() {
//   size(1600, 900);
//   img = loadImage("Background.png");
// }
//
// void draw() {
//   // x, y value to crop image
//   image(img, 0, 0);
// }

PImage img;
void setup() {
  size(1600, 900);
  img = loadImage("QuestionMark.png");
}

void draw() {
  image(img, 0, 0);
}

void keyPressed() {
  if(key==CODED) {
    if(keyCode == 112) {
      println("?");
    }
  }
}
