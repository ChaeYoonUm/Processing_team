// Namsengi.pde
// Written by Nam Eun Su.

class Namsengi extends Animal {
PImage body,head;
float x,y;

float ri=0.2;
float incr = 0.001;
float theta=0;

  //////////////////
  // constructors //
  //////////////////

  Namsengi() {
    super();
    body=loadImage("nam_body.png");
  head=loadImage("nam_head.png");
  }
  Namsengi(float x, float y) {
    super(x, y);
  }
  Namsengi(float x, float y, float rotation) {
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

  // head
  pushMatrix();
  x=ri*cos(theta)+x;
  translate(x, y);

  image(head,0,0);
  
  theta+=incr;
  
  popMatrix();
  
  popMatrix();
  
  pushMatrix();
  translate(position.x, position.y);
  image(body,0,0);
  popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
