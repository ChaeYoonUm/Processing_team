// Person.pde
// Written by Lee Yong Kyu.

class Person extends Animal {

  ///////////////
  // variables //
  ///////////////

  PImage side,diag,front;

  // 0 = side;
  // 1 = diagonal
  // 2 = front
  int face_condition;

  //////////////////
  // constructors //
  //////////////////

  Person() {
    this(0, 0, 0);
  }
  Person(float x, float y) {
    this(x, y, 0);
  }
  Person(float x, float y, float rotation) {
    super(x, y, rotation);
    side=loadImage("Person_Side.png");
    diag=loadImage("Person_Diagonal.png");
    front=loadImage("Person_Front.png");
    face_condition = 0;
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
    if(face_condition == 0) {
      image(side, 0, 0);
    } else if(face_condition == 1) {
      image(diag, 0, 0);
    } else {
      image(front, 0, 0);
    }
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
