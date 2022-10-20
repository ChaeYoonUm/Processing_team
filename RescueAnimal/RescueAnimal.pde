
// background variables.
PImage background;
float backgroundX,backgroundY;
float minBrightness;
static final int BACKGROUND_WIDTH = 9600;
static final int BACKGROUND_HEIGHT = 5400;


// Animals.
Animal[] animals;
static final int ANIMAL_LENGTH = 8;

// setup
void setup(){
  size(1600,900);
  background=loadImage("bg.png");
  backgroundX=0;
  backgroundY=0;
  minBrightness=0;

  // Animals.
  animals = new Animal[ANIMAL_LENGTH];
  animals[0] = new Crab(600, 1080);
  animals[1] = new Durumi(4700, 1800);
  // animals[2] = new GasiFish(9000, 5000);
  animals[2] = new GasiFish(9000, 5000);
  animals[3] = new Mae(800, 5000);
  // animals[3] = new Mae(9000, 5000);
  animals[4] = new Namsengi(5400, 3600);
  animals[5] = new Noru(9000, 400);
  animals[6] = new Sak(6400, 1600);
  animals[7] = new SuwonFrog(2200, 600);

  // Vertex boundary for each animal.
  // Crab
  animals[0].addBoundaryVertex(-50, -50);
  animals[0].addBoundaryVertex(-50, 50);
  animals[0].addBoundaryVertex(50, 50);
  animals[0].addBoundaryVertex(50, -50);


  animals[2].addBoundaryVertex(-50, -50);
  animals[2].addBoundaryVertex(-50, 50);
  animals[2].addBoundaryVertex(50, 50);
  animals[2].addBoundaryVertex(50, -50);
}

void draw(){
  // load pixels
  background.loadPixels();
  loadPixels();

  // Draw background
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int locBG = (int)backgroundX + x + ((int)backgroundY + y) * background.width;
      int loc = x + y * width;

      pixels[loc] = background.pixels[locBG];
    }
  }

  updatePixels();


  // Draw animals here
  pushMatrix();
  translate(-backgroundX, -backgroundY);
  for(int i = 0; i < ANIMAL_LENGTH; i++) {
    animals[i].drawAnimal();
  }
  // animals[0].drawAnimal();
  // animals[2].drawAnimal();

  animals[2].showBoundary();
  popMatrix();
  loadPixels();

  // Flashlight.
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int loc = x + y * width;

      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);

      float distance = dist(x, y, mouseX, mouseY);

      float adjustBrightness = map(distance, 0, 250, 1, minBrightness);

      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();
}

// Move.
void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
     backgroundY-=100;
    }else if(keyCode==DOWN){
     backgroundY+=100;
    }else if(keyCode==LEFT){
     backgroundX-=100;
    }else if(keyCode==RIGHT){
     backgroundX+=100;
    }
  }
  backgroundX=constrain(backgroundX,0,8000);
  backgroundY=constrain(backgroundY,0,4500);
  println(backgroundX + ", " + backgroundY);
}

// Click.
void mousePressed() {
  // for(int i = 0; i < ANIMAL_LENGTH; i++) {
  //   if(animals[i].isMouseOn(mouseX, mouseY)) {
      minBrightness += 1f/ANIMAL_LENGTH;
      minBrightness = constrain(minBrightness, 0, 1);
  //   }
  // }
  println(animals[0].isMouseOn(mouseX, mouseY, backgroundX, backgroundY) ? "inside" : "outside");
}
