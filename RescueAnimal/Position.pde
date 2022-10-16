// Position.pde
// Position class will be used to represent objects 2D coordinate position.
// idk how useful it is... It might be deleted in some cases.
// Written by Lee Yong Kyu.

class Position {
  ///////////////
  // variables //
  ///////////////
  float x, y;

  //////////////////
  // constructors //
  //////////////////
  Position() {
    this(0, 0);
  }
  Position(float x, float y) {
    this.x = x;
    this.y = y;
  }

  /////////////
  // methods //
  /////////////
  
  Position add(Position b) {
    return new Position(x + b.x, y + b.y);
  }
}
