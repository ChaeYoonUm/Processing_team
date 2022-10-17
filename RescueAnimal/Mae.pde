// Mae.pde
// Written by Lee Yong Kyu.

class Mae extends Animal {

  //////////////////
  // constructors //
  //////////////////

  Mae() {
    super();
  }
  Mae(float x, float y) {
    super(x, y);
  }
  Mae(float x, float y, float rotation) {
    super(x, y, rotation);
  }


  /////////////
  // methods //
  /////////////

  // Draw Animal.
  void drawAnimal() {
    pushMatrix();
    translate(position.x,position.y);
    rectMode(CENTER);
    rect(0, 0, 100, 50);
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {
    setPosition(position.x + 1, position.y);
  }
}