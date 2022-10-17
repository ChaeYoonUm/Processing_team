// Animal.pde
// Animal class will be inherited to 8 different animal classes.
// It will provide the basic components of different animal classes.
// Written by Lee Yong Kyu.

abstract class Animal extends AnimalClickable {
  ///////////////
  // variables //
  ///////////////

  // variables to draw.
  Position position;
  float rotation;

  //////////////////
  // constructors //
  //////////////////

  Animal() {
    this(0, 0, 0);
  }
  Animal(float x, float y) {
    this(x, y, 0);
  }
  Animal(float x, float y, float rotation) {
    position = new Position(x, y);
    this.rotation = rotation;
    setOffset(position);
  }

  /////////////
  // methods //
  /////////////

  // Draw Animal.
  abstract void drawAnimal();

  // Modify some body parts to describe movement of an animal.
  abstract void move();

  // Set a new position and adjust offset of click area.
  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
    setOffset(position);
  }


  ////////////////////
  // implementation //
  ////////////////////
}
