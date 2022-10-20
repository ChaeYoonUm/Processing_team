// GasiFish.pde
// Written by Yang Eun Seo.

class GasiFish extends Animal {

  ///////////////
  // variables //
  ///////////////

  PImage gasi;
  float tx = 0.0, ty = 0.0;
  float noiseValueX, noiseValueY;

  //////////////////
  // constructors //
  //////////////////

  GasiFish() {
    this(0, 0, 0);
  }
  GasiFish(float x, float y) {
    this(x, y, 0);
  }
  GasiFish(float x, float y, float rotation) {
    super(x, y, rotation);
    gasi = loadImage("gasi.png");

  }

  /////////////
  // methods //
  /////////////

  // Draw Animal.
  void drawAnimal() {
    imageMode(CENTER);

    pushMatrix();
    move();
    translate(position.x, position.y);
    scale(0.2);
    image(gasi,0,0);
    popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {
    position.x = map(noise(tx), 0, 1, BACKGROUND_WIDTH-1200, BACKGROUND_WIDTH-200);
    tx += 0.03;
    position.y = map(noise(ty), 0, 1, -0.8*(position.x-9000)+4500, BACKGROUND_HEIGHT-100);
    ty += 0.02;
    // position.x = constrain(position.x, BACKGROUND_WIDTH-1200, BACKGROUND_WIDTH-200);
    // position.y = constrain(position.y, -0.8*(position.x-9000)+4500, BACKGROUND_HEIGHT-100);
    // setPosition(position.x, position.y);
    setOffset(position);
  }
}
