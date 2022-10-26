// Crab.pde
// Written by Yang Eun Seo.

class Person extends Animal {

  ///////////////
  // variables //
  ///////////////

  PImage side,diag,front;

  // 0 = side;
  // 1 = diagonal
  // 2 = front
  int face_condition;
  
  String dialogue1, dialogue2;

  //////////////////
  // constructors //
  //////////////////

  Person() {
    this(0, 0, 0);
    
    dialogue1 = "Now that all the animals are gone,";
    dialogue2 = "Who is next?";
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
    scale(0.8);
    if(face_condition == 0) {
      image(side, 0, 5);
    } else if(face_condition == 2) {
      image(diag, 0, 0);
      delay(2000);
    } else {
      delay(2000);
      image(front, 0, 0);
    }
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
  
  boolean isMouseOn(int mouse_x, int mouse_y) {
    // https://bowbowbow.tistory.com/24
    // use this.

    int cnt = 0;
    Position backgroundPos = new Position(width/2, height/2);
    for(int i = 0; i < polygon.size(); i++) {
      Position pos1 = polygon.get(i).add(offset).add(backgroundPos);
      Position pos2 = polygon.get((i+1) % polygon.size()).add(offset).add(backgroundPos);

      if((pos2.y < mouse_y) != (pos1.y < mouse_y)) {
        // calculate cross point.
        float atX = (mouse_y - pos1.y) * (pos2.x - pos1.x) / (pos2.y - pos1.y) + pos1.x;
        if(atX > mouse_x) cnt++;
      }
    }
    
    isClicked = cnt % 2 != 0;
    return isClicked;
  }
}
