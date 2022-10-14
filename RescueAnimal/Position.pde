// Position.pde
// Position class will be used to represent objects 2D coordinate position.
// idk how useful it is... It might be deleted in some cases.
// Written by Lee Yong Kyu.

class Position {
  ///////////////
  // variables //
  ///////////////
  int x, y;

  //////////////////
  // constructors //
  //////////////////
  Position() {
    this(0, 0);
  }
  Position(int x, int y) {
    this.x = x;
    this.y = y;
  }
}
