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
    super();
    body=loadImage("mae.png");
    xtime=0.0;
  ytime=0.5;
  }
  Mae(float x, float y) {
    super(x, y);
  }
  Mae(float x, float y, float rotation) {
    super(x, y, rotation);
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
  scale(0.2);
  position.x=noise(xtime)*width;
  position.y=noise(ytime)*height;
  
  xtime+=incr;
  ytime+=incr;
  
  position.x=constrain(position.x,176,width);
  position.y=constrain(position.y,135,height);
  image(body,0,0);
  
  
  popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
