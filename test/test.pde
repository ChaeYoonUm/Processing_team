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

// PImage img;
String[] s;
void setup() {
  size(1600, 900);
  // img = loadImage("QuestionMark.png");
  s = loadStrings("https://www.theworldcounts.com/embeds/counters/66");
  for(int i = 0; i < 100; i++) {
    if(s[i] == null) break;
    println(s[i]);
  }
}

void draw() {
  // image(img, 0, 0);
}

void keyPressed() {
  if(key==CODED) {
    if(keyCode == 112) {
      println("?");
    }
  }
}
