// UIClickable.pde
// UIClickable class will be inherited into UI.
// It will check the rectangular area.
// Written by Lee Yong Kyu.

class UIClickable implements IClickable {

  ///////////////
  // variables //
  ///////////////

  Position lefttop = null, rightbottom = null;

  /////////////
  // methods //
  /////////////

  // Rectangular area check
  boolean isMouseOn(int mouse_x, int mouse_y) {
    if(!(lefttop.x < mouse_x && mouse_x < rightbottom.x)) return false;
    if(!(lefttop.y < mouse_y && mouse_y < rightbottom.y)) return false;
    return true;
  }

  // Should be added lefttop first and rightbottom next.
  void addBoundaryVertex(int boundary_x, int boundary_y) {
    Position pos = new Position(boundary_x, boundary_y);
    if(lefttop == null) lefttop = pos;
    else if(rightbottom == null) rightbottom = pos;
    return;
  }

  void drawBoundary() {
    if(lefttop == null || rightbottom == null) return;
    rect(lefttop.x, lefttop.y, rightbottom.x, rightbottom.y);
  }
}
