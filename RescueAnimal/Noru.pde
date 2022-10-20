// Noru.pde
// Written by Lee Yong Kyu.

class Noru extends Animal {
  PImage body,head,pool;

  float rot=0;
  float rotateFactor = 0.01;
  //////////////////
  // constructors //
  //////////////////

  Noru() {
    this(0, 0, 0);
  }
  Noru(float x, float y) {
    this(x, y, 0);
  }
  Noru(float x, float y, float rotation) {
    super(x, y, rotation);
    body=loadImage("noru_body.png");
    head=loadImage("noru_head.png");
    pool=loadImage("pool.png");
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
    translate(-82+10, -108+60);
    rotate(-PI/4*rot);
    image(head,-10,-60);
    popMatrix();
    
    popMatrix();
    
    pushMatrix();
    translate(position.x,position.y);
    image(pool,-190,15);
    popMatrix();
    
    rot += rotateFactor;
    if(rot >= 1.5) rotateFactor = -rotateFactor;
    else if(rot < 0) rotateFactor = -rotateFactor;
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
