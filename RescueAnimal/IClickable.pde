// IClickable.pde
// IClickable class will be inherited to other classes which are clickable.
// It will provide the method which can be used to check whether the mouse is clicked in specific range.
// Written by Lee Yong Kyu.

interface IClickable {

  /////////////
  // methods //
  /////////////

  boolean isMouseOn(int mouse_x, int mouse_y);

  void addBoundaryVertex(int boundary_x, int boundary_y);

  void showBoundary();
}
