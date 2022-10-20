// GasiFish.pde
// Written by Yang Eun Seo.
PImage gasi;
float tx = 0.0, ty = 0.0;
float noiseValueX, noiseValueY;

class GasiFish extends Animal {


  //////////////////
  // constructors //
  //////////////////

  GasiFish() {
    this(0, 0, 0);
  }
  GasiFish(float x, float y) {
    this(0, 0, 0);
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
      translate(position.x, position.y);
      scale(0.2);
      noiseValueX = noise(tx);
      tx += 0.03;
      noiseValueY = noise(ty);
      ty += 0.02;
      image(gasi,noiseValueX * 500,noiseValueY*500);
      //println(noiseValueX);

  popMatrix();
  }

  // Modify some body parts to describe movement of an animal.
  void move() {

  }
}
