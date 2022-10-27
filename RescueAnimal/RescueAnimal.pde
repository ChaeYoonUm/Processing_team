
// background variables.
PImage background, Free;
float backgroundX,backgroundY;
float minBrightness;
static final int BACKGROUND_WIDTH = 9600;
static final int BACKGROUND_HEIGHT = 5400;
boolean AL=false;
animalList AniList;

//여기에 냅다 생성
animalList animallist = new animalList();



// Animals.
Animal[] animals;
static final int ANIMAL_LENGTH = 8;

// Epilogue
Epilogue ep;

// API : EndangeredSpeciesRateAPI
EndangeredSpeciesRateAPI esrAPI;

// setup
void setup(){
  size(1600,900);
  AniList=new animalList();
  background=loadImage("Background.png");
  Free = loadImage("free.png");
  backgroundX=2600;
  backgroundY=2550;
  minBrightness=0;


  boolean testWithoutDark = false;
  if(testWithoutDark) minBrightness = 1;
  // Animals.
  animals = new Animal[ANIMAL_LENGTH];
  animals[0] = new Crab(600, 1080);
  animals[1] = new Durumi(4500, 2000);
  animals[2] = new GasiFish(9000, 5000);
  animals[3] = new Mae(7200, 300);
  animals[4] = new Namsengi(5400, 3600);
  animals[5] = new Noru(9000, 1100);
  animals[6] = new Sak(6400, 1600);
  animals[7] = new SuwonFrog(2200, 600);

  // Vertex boundary for each animal.
  // Crab
  animals[0].addBoundaryVertex(-100, -50);
  animals[0].addBoundaryVertex(-100, 50);
  animals[0].addBoundaryVertex(100, 50);
  animals[0].addBoundaryVertex(100, -50);

  // Durumi
  animals[1].addBoundaryVertex(-300, -200);
  animals[1].addBoundaryVertex(-300, 50);
  animals[1].addBoundaryVertex(50, 50);
  animals[1].addBoundaryVertex(50, -200);

  // GasiFish
  animals[2].addBoundaryVertex(-100, -50);
  animals[2].addBoundaryVertex(-100, 50);
  animals[2].addBoundaryVertex(100, 50);
  animals[2].addBoundaryVertex(100, -50);

  // Mae
  animals[3].addBoundaryVertex(-100, -50);
  animals[3].addBoundaryVertex(-100, 80);
  animals[3].addBoundaryVertex(100, 80);
  animals[3].addBoundaryVertex(100, -50);

  // Namsengi
  animals[4].addBoundaryVertex(0, -120);
  animals[4].addBoundaryVertex(-100, -50);
  animals[4].addBoundaryVertex(-150, 50);
  animals[4].addBoundaryVertex(150, 50);
  animals[4].addBoundaryVertex(100, -50);

  // Noru
  animals[5].addBoundaryVertex(-300, -300);
  animals[5].addBoundaryVertex(-300, 100);
  animals[5].addBoundaryVertex(100, 100);
  animals[5].addBoundaryVertex(100, -300);

  // Sak
  animals[6].addBoundaryVertex(-100, -150);
  animals[6].addBoundaryVertex(-100,150);
  animals[6].addBoundaryVertex(100, 150);
  animals[6].addBoundaryVertex(100, -150);

  // SuwonFrog
  animals[7].addBoundaryVertex(-100, -150);
  animals[7].addBoundaryVertex(-100, 70);
  animals[7].addBoundaryVertex(100, 70);
  animals[7].addBoundaryVertex(100, -150);

  AniList.AL_setup();

  ep = new Epilogue();

  esrAPI = new EndangeredSpeciesRateAPI();
}

void draw(){
  if(ep.isEnd) {
    ep.run();
    return;
  }

  if(AL==true){
    image(AniList.backgroundCapture, 800, 450);
    AniList.AL_draw();
    return;
  }

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
     //animals[i].showBoundary();
  }

  popMatrix();
  loadPixels();

  // Flashlight.
  if(minBrightness > 0.99) return;

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

  pushMatrix();
  translate(50,50);
  scale(0.5);
  noTint();
  image(Free,0,0);
  popMatrix();

  if(AniList.Freee==true)
    AniList.AL_draw();





    esrAPI.drawAPI();
}

// Move.
void keyPressed(){
  if(ep.isEnd) return;
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
  // println(backgroundX + ", " + backgroundY);

  if(key==TAB){
    AniList.Freee=false;

    AL = !AL;
    if(!AL) return;

    if(AniList.backgroundCapture == null) AniList.backgroundCapture = createImage(width, height, RGB);
    AniList.backgroundCapture.loadPixels();
    loadPixels();
    for(int y = 0; y < height; y++) {
      for(int x = 0 ; x < width; x++) {
        int loc = x + y * width;
        AniList.backgroundCapture.pixels[loc] = pixels[loc];
      }
    }
    AniList.backgroundCapture.updatePixels();
  }
  AniList.AL_keyPressed();
}

// Click.
void mousePressed() {
  for(int i = 0; i < ANIMAL_LENGTH; i++) {
    if(animals[i].isMouseOn(mouseX, mouseY)) {
      minBrightness += 1f/ANIMAL_LENGTH;
      minBrightness = constrain(minBrightness, 0, 1);
      AniList.col[i]=true;
      animals[i].setIsClicked(true);
    }
  }
  
  int cnt = 0;
    for(int i = 0 ; i < 8; i++){
      if(animals[i].getIsClicked() == true){
            cnt++;
      }
    }
    if(cnt == 8)
      ep.isEnd = true;

  AniList.AL_mousePressed();
  // println(animals[3].isMouseOn(mouseX, mouseY, backgroundX, backgroundY) ? "inside" : "outside");

/*
  if(mouseButton == RIGHT) {
    //ep.isEnd = true;
    int cnt = 0;
    for(int i = 0 ; i < 8; i++){
      if(animals[i].getIsClicked() == true){
            cnt++;
      }
    }
    if(cnt == 8)
      ep.isEnd = true;
      
  }
*/
  if(ep.personClick(mouseX, mouseY)) {
    println("Person");
  }
}
