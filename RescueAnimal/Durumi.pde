// Durumi.pde
// Written by Um Chae Yoon.

class Durumi extends Animal {
  PImage body,head,pool;

  float rot=0;
  float rotateFactor = 0.01;

  //////////////////
  // constructors //
  //////////////////

  Durumi() {
    this(0, 0, 0);
  }
  Durumi(float x, float y) {
    this(x, y, 0);
    body=loadImage("duru_body.png");
    head=loadImage("duru_head.png");
  }
  Durumi(float x, float y, float rotation) {
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
    
    // head
    pushMatrix();
    translate(-279+116, -255+163);
    rotate(-PI/4*rot);
    image(head,-116,-190);
    popMatrix();
    
    popMatrix();
    
    
    rot += rotateFactor;
    if(rot >= 1.5) rotateFactor = -rotateFactor;
    else if(rot < 0) rotateFactor = -rotateFactor;
    }

    // Modify some body parts to describe movement of an animal.
    void move() {

  }
}
