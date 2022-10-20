// UIClickable.pde
// UIClickable class will be inherited into UI.
// It will check the rectangular area.
// Written by Lee Yong Kyu.

class UIClickable implements IClickable {

  ///////////////
  // variables //
  ///////////////

  Position lefttop = null, rightbottom = null;
  Position offset;

  /////////////
  // methods //
  /////////////

  // offset used in showing boundary and mouse enter checking
  void setOffset(Position _offset) {
    offset = _offset;
  }

  // Rectangular area check
  boolean isMouseOn(int mouse_x, int mouse_y, float background_X, float background_Y) {
    if(!(lefttop.x + offset.x < mouse_x && mouse_x < rightbottom.x + offset.x)) return false;
    if(!(lefttop.y + offset.y < mouse_y && mouse_y < rightbottom.y + offset.y)) return false;
    return true;
  }

  // Should be added lefttop first and rightbottom next.
  void addBoundaryVertex(int boundary_x, int boundary_y) {
    Position pos = new Position(boundary_x, boundary_y);
    if(lefttop == null) lefttop = pos;
    else if(rightbottom == null) rightbottom = pos;
    return;
  }

  void showBoundary() {
    if(lefttop == null || rightbottom == null) return;
    pushMatrix();
    rectMode(CORNERS);
    translate(offset.x,offset.y);
    rect(lefttop.x, lefttop.y, rightbottom.x, rightbottom.y);
    popMatrix();
  }
}
