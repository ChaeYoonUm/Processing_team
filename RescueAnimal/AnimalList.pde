PImage QM,iB,iP, Ww, Bm, Rt, Bear, Bird, Fish, Ig;
void setup() {
  size(1600, 900);
  QM = loadImage("QuestionMark.png");
  iB = loadImage("instructionB.png");
  iP = loadImage("instructionP.png");
  Ww = loadImage("window.png");
  Bm = loadImage("Bottom.png");
  Rt = loadImage("Right.png");
  Bear = loadImage("bear.png");
  Bird = loadImage("bird.png");
  Fish = loadImage("fish.png");
  Ig = loadImage("ig.png");
  
  
}

void draw() {
  background(127);
  imageMode(CENTER);
  image(Ww, 800, 450);
  image(iB, 1460, 450);
  image(iP, 1, 1);
  image(Rt, 230, 450);
  image(QM, 230, 300);
  image(QM, 230, 600);
  image(Bm, 800, 700);
  image(Ig, 450, 700);
  image(Bear, 700, 700); 
  image(Fish, 950, 700);
  image(Bird, 1200, 700);
}
