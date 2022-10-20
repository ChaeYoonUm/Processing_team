// AnimalClickable.pde
// AnimalClickable class will be inherited into Animal.
// It will check the polygonal area.
// Written by Lee Yong Kyu.

class AnimalClickable implements IClickable {

  ///////////////
  // variables //
  ///////////////

  ArrayList<Position> polygon = null;
  Position offset;

  /////////////
  // methods //
  /////////////

  // offset used in showing boundary and mouse enter checking
  void setOffset(Position _offset) {
    offset = _offset;
  }

  boolean isMouseOn(int mouse_x, int mouse_y, float background_X, float background_Y) {
    // https://bowbowbow.tistory.com/24
    // use this.
    int cnt = 0;
    Position backgroundPos = new Position(-background_X, -background_Y);
    for(int i = 0; i < polygon.size(); i++) {
      Position pos1 = polygon.get(i).add(offset).add(backgroundPos);
      Position pos2 = polygon.get((i+1) % polygon.size()).add(offset).add(backgroundPos);

      if((pos2.y < mouse_y) != (pos1.y < mouse_y)) {
        // calculate cross point.
        float atX = (mouse_y - pos1.y) * (pos2.x - pos1.x) / (pos2.y - pos1.y) + pos1.x;
        if(atX > mouse_x) cnt++;
      }
    }
    if(cnt % 2 == 0) return false;
    else return true;
  }

  void addBoundaryVertex(int boundary_x, int boundary_y) {
    if(polygon == null) polygon = new ArrayList<Position>(1);
    Position pos = new Position(boundary_x, boundary_y);
    polygon.add(pos);
  }

  void showBoundary() {
    // draw shape
    pushMatrix();
    translate(offset.x,offset.y);
    float angle;
    beginShape();
    for(int i = 0; i < polygon.size(); i++) {
      vertex(polygon.get(i).x, polygon.get(i).y);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
