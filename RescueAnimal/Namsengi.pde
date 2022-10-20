// Namsengi.pde
// Written by Nam Eun Su.

class Namsengi extends Animal {
  PImage body,head;
  float x;

  float ri=0.7;
  float incr = 0.01;
  float theta=0;

  //////////////////
  // constructors //
  //////////////////

  Namsengi() {
    this(0, 0, 0);
  }
  Namsengi(float x, float y) {
    this(x, y, 0);
  }
  Namsengi(float x, float y, float rotation) {
    super(x, y, rotation);
    body=loadImage("nam_body.png");
    head=loadImage("nam_head.png");
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
    translate(x + 100, 0);
    image(head,0,0);
    theta+=incr;
    popMatrix();

    image(body,0,0);
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
