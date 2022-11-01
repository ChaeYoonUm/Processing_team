// WhoIsNext.pde
// Main Sketch.
// Play music, draw background, API, UI, animals, and etc... while the 8 animals are not found.
// Written by whole members.

///////////////
// variables //
///////////////

// background variables.

import processing.sound.*;
SoundFile sound;
Sound s;
float e = 0.0;
float vol = 1;

SoundFile devas_sound;
Sound devas_s;

int cnt = 0;
String rate;


PImage background, Free;
float backgroundX,backgroundY;
float minBrightness;
static final int BACKGROUND_WIDTH = 9600;
static final int BACKGROUND_HEIGHT = 5400;
boolean AL=false;
AnimalList aniList;

// Animals.
Animal[] animals;
static final int ANIMAL_LENGTH = 8;

// Epilogue
Epilogue ep;

// API : EndangeredSpeciesRateAPI
EndangeredSpeciesRateAPI esrAPI;

///////////
// setup //
///////////

void setup(){
  size(1600,900);
  aniList = new AnimalList();
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

  aniList.AL_setup();

  ep = new Epilogue();

  esrAPI = new EndangeredSpeciesRateAPI();

  // background sound setup
  e = 0.0;
  vol = 1;
  sound = new SoundFile(this, "background.mp3");
  s = new Sound(this);
  sound.loop();
  devas_sound = new SoundFile(this, "deepblue.wav");
}

//////////
// draw //
//////////

void draw(){
  // the game was end?
  if(ep.isEnd) {
    ep.run();

    if(devas_sound.isPlaying() == false && ep.isDevastated == true){
      sound.pause();
      devas_sound.loop();
    }
    return; // execute only epilogue.
  }

  if(AL==true){
    image(aniList.backgroundCapture, 800, 450);
    aniList.AL_draw();
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

  // Announcement?
  pushMatrix();
  translate(50,50);
  scale(0.5);
  noTint();
  image(Free,0,0);
  popMatrix();

  // draw animal found rate
  rate=cnt+"/8";

  pushMatrix();
  translate(width-40,50);
  textAlign(CENTER);
  textSize(40);
  text(rate,0,0);

  popMatrix();


  // draw Announcement
  if(aniList.Freee==true) aniList.AL_draw();

  // draw API
  esrAPI.drawAPI();
}

////////////////
// keyPressed //
////////////////

void keyPressed(){
  // Move.
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

  // toggle animal list UI
  if(key==TAB){
    aniList.Freee=false;

    AL = !AL;
    if(!AL) return;

    if(aniList.backgroundCapture == null) aniList.backgroundCapture = createImage(width, height, RGB);
    aniList.backgroundCapture.loadPixels();
    loadPixels();
    for(int y = 0; y < height; y++) {
      for(int x = 0 ; x < width; x++) {
        int loc = x + y * width;
        aniList.backgroundCapture.pixels[loc] = pixels[loc];
      }
    }
    aniList.backgroundCapture.updatePixels();
  }
  aniList.AL_keyPressed();
}

//////////////////
// mousePressed //
//////////////////

void mousePressed() {
  // animal click. related with flashlight and animal found rate.
  for(int i = 0; i < ANIMAL_LENGTH; i++) {
    if(animals[i].isMouseOn(mouseX, mouseY)) {
      minBrightness += 1f/ANIMAL_LENGTH;
      minBrightness = constrain(minBrightness, 0, 1);
      aniList.col[i]=true;
      animals[i].setIsClicked(true);
    }
  }

  cnt = 0;
  // number of animals that are clicked check
  for(int i = 0 ; i < 8; i++){
    if(animals[i].getIsClicked() == true){
          cnt++;
    }
  }
  if(cnt == 8) ep.isEnd = true;

  // Animal List UI click check
  aniList.AL_mousePressed();

  // In Epilogue, person click check
  if(ep.personClick(mouseX, mouseY)) {
    println("Person");
  }
}

// volume control
 void mouseWheel(MouseEvent event){
   e += event.getCount();

   vol += -e*0.1f;
   vol = constrain(vol, 0, 1);

   s.volume(vol);


 }
