// Mae.pde
// Written by Lee Yong Kyu.

class Mae extends Animal {
  PImage body;

  float xtime,ytime;
  float incr = 0.01;
  //////////////////
  // constructors //
  //////////////////

  Mae() {
    this(0, 0, 0);
  }
  Mae(float x, float y) {
    this(x, y, 0);
  }
  Mae(float x, float y, float rotation) {
    super(x, y, rotation);
    body=loadImage("mae.png");
    xtime=0.0;
    ytime=0.5;
  }


  /////////////
  // methods //
  /////////////

  // Draw Animal.
  void drawAnimal() {
    imageMode(CENTER);

    // body
    pushMatrix();
    move();
    translate(position.x, position.y);
    scale(0.2);
    image(body,0,0);


    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {
    position.x=map(noise(xtime), 0, 1, 6800, BACKGROUND_WIDTH-200);
    position.y=map(noise(ytime), 0, 1, 2800, 3200);

    xtime+=incr;
    ytime+=incr;

    // position.x=constrain(position.x, 6800, BACKGROUND_WIDTH-200);
    // position.y=constrain(position.y, 2800, 3200);
    // setPosition(position.x, position.y);
    setOffset(position);
  }
}
