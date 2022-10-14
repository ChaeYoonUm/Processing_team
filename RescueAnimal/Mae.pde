// Mae.pde
// Written by Lee Yong Kyu.

class Mae extends Animal {

  //////////////////
  // constructors //
  //////////////////

  Mae() {
    super();
  }
  Mae(int x, int y) {
    super(x, y);
  }
  Mae(int x, int y, float rotation) {
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
    rect(-50,-50, 100, 50);
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
