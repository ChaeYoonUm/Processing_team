// Sak.pde
// Written by Nam Eun Su.

PImage body,arm,tongue;

float rot=0;
float rotateFactor = 0.01;

boolean melong = false;

class Sak extends Animal {

  //////////////////
  // constructors //
  //////////////////

  Sak() {
    super();
    body=loadImage("sak_body.png");
    arm=loadImage("sak_arm.png");
    tongue=loadImage("sak_tongue.png");
  }
  Sak(float x, float y) {
    super(x, y);
  }
  Sak(float x, float y, float rotation) {
    super(x, y, rotation);
  }


  /////////////
  // methods //
  /////////////

  // Draw Animal.
  void drawAnimal() {
    imageMode(CENTER);
    
    rot += rotateFactor;
  if(rot >= 1.5) rotateFactor = -rotateFactor;
  else if(rot <= -1.5) rotateFactor = -rotateFactor;
  println(rot);
  
  if (-0.2 < rot && rot < 0.2) melong = true;
  else melong = false;
  
  
  // body
  pushMatrix();
  translate(position.x, position.y);
  image(body,0,0);
  //popMatrix();
  
  
  pushMatrix();
  translate(-40 , 60);
  rotate(PI/36*rot);
  image(arm, 25, -20);
  popMatrix();
  
  popMatrix();

  if(melong == true) { 
  pushMatrix();
  translate(position.x, position.y);
  image(tongue, 13, 0);
  popMatrix();
  }
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
