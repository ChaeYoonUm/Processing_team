// SuwonFrog.pde
// Written by Nam Eunsu

PImage body,head,tongue;

float rot=0;
float rotateFactor = 0.01;

boolean melong = false;

  
  
  

class SuwonFrog extends Animal {

  //////////////////
  // constructors //
  //////////////////

  SuwonFrog() {
    super();
    body=loadImage("frog_body.png");
  head=loadImage("frog_head.png");
  tongue=loadImage("frog_tongue.png");
  }
  SuwonFrog(float x, float y) {
    super(x, y);
  }
  SuwonFrog(float x, float y, float rotation) {
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
  
  if (-0.1 < rot && rot < 0.1) melong = true;
  else melong = false;
  
  
  // body
  pushMatrix();
  translate(position.x, position.y);
  image(body,0,0);
  //popMatrix();
  
  // head
  pushMatrix();
  translate(0, -80);
  //image(head,0,-60);
  popMatrix();
  if(melong ==false) {
  pushMatrix();
  translate(0, -50);
  rotate(-PI/12*rot);
  image(head, 0, -60);
  popMatrix();
  }
  popMatrix();

  if(melong == true) { 
  pushMatrix();
  translate(position.x , position.y);
  image(tongue, -60, -110);
  popMatrix();
  }
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
