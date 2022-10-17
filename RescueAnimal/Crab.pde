// Crab.pde
// Written by Yang Eun Seo.

class Crab extends Animal {
PImage body,RH,LH;

float rot=0;
float rotateFactor = 0.1;

  //////////////////
  // constructors //
  //////////////////

  Crab() {
    super();
    body=loadImage("crab_body.png");
  RH=loadImage("crab_RH.png");
  LH=loadImage("crab_LH.png");

  }
  Crab(float x, float y) {
    super(x, y);
  }
  Crab(float x, float y, float rotation) {
    super(x, y, rotation);
  }

  /////////////
  // methods //
  /////////////

  // Draw Animal.
  void drawAnimal() {
  imageMode(CENTER);
  // body
  pushMatrix();
  translate(position.x, position.y);
  image(body,0,0);
  
  // rh
  pushMatrix();
  translate(70-21, -28+28);
  rotate(-PI/4*rot);
  image(RH,21,-28);
  popMatrix();
  
  // lh
  pushMatrix();
  translate(-70+21, -28+28);
  rotate(PI/4*rot);
  image(LH,-21,-28);
  popMatrix();
  
  popMatrix();
  
  rot += rotateFactor;
  if(rot >= 1) rotateFactor = -rotateFactor;
  else if(rot < 0) rotateFactor = -rotateFactor;
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
