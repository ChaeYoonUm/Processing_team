// AnimalClickable.pde
// AnimalClickable class will be inherited into Animal.
// It will check the polygonal area.
// Written by Lee Yong Kyu.

class AnimalClickable implements IClickable {

  ///////////////
  // variables //
  ///////////////

  ArrayList<Position> polygon = null;

  /////////////
  // methods //
  /////////////

  boolean isMouseOn(int mouse_x, int mouse_y) {
    // https://bowbowbow.tistory.com/24
    // use this.
    return true;
  }

  void addBoundaryVertex(int boundary_x, int boundary_y) {
    if(polygon == null) polygon = new ArrayList<Position>(1);
    Position pos = new Position(boundary_x, boundary_y);
    polygon.add(pos);
  }

  void drawBoundary() {
    // draw shape
  }
}
