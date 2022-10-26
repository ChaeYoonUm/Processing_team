abstract class UserInterface extends UIClickable {
  
  ///////////////
  // variables //
  ///////////////

  // variables to draw.
  Position position;

  //////////////////
  // constructors //
  //////////////////

  UserInterface() {
    this(0, 0);
  }
  UserInterface(float x, float y) {
    position = new Position(x, y);
    setOffset(position);
  }

  /////////////
  // methods //
  /////////////

  // Draw UI.
  abstract void drawUI();

  // Set a new position and adjust offset of click area.
  void setPosition(float x, float y) {
    position.x = x;
    position.y = y;
    setOffset(position);
  }
}
