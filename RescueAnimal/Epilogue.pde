// Written by Lee Yong Kyu, Yang Eun Seo

class Epilogue {

  ///////////////
  // variables //
  ///////////////

  boolean isEnd;

  // takePicture
  PImage animalsPicture, backgroundPicture, backgroundPicDestination;
  static final int MAX_BRIGHTNESS = 3;
  float brightness_Background;
  float shutter, shutterSpeed;

  // monologue
  PGraphics pg_Monologue;
  String monologue11, monologue12, monologue21, monologue22, monologue3;
  float pg_y, pg_y_speed;
  static final float MAX_PG_Y = -1300;

  // devastated
  PImage backgroundDevastated, partialBackDev;
  String devastating, dialogue1_1, dialogue1_2, dialogue2;
  Person p;

  PFont fontHuman, fontMsg;

  // endingMsg
  PGraphics pg_Ending;
  float pgE_y, pgE_y_speed;
  static final float MAX_PGE_Y=-1300;
  
  // 0 = not ended
  // 1 = gather
  // 2 = takePicture
  // 3 = monologue
  // 4 = devastated
  // 5 = endingMsg
  int condition;

  //////////////////
  // constructors //
  //////////////////

  Epilogue() {
    fontMsg = createFont("The Barimhare.ttf", 128);
    fontHuman = createFont("adrip1.ttf", 128);
    
    isEnd = false;
    condition = 2;

    // takePicture
    brightness_Background = MAX_BRIGHTNESS - 1;
    shutter = 0;
    shutterSpeed = 0.1;
    animalsPicture = loadImage("Epilogue_AnimalsPicture.png");
    backgroundPicture = null;
    backgroundPicDestination = null;

    // monologue
    pg_Monologue = null;
    monologue11 = "Around the world, animals are disappearing 2 percent annually";
    monologue12 = "due to indiscriminate illegal capture and environmental pollution.";
    monologue21 = "More than one million species,";
    monologue22 = "one-eighth of existing plants and animals, are endangered.";
    monologue3 = "If animals disappear one by one, the Earth will be in great confusion.";
    pg_y = 0;
    pg_y_speed = 10f; // original value = 2f; test = 10f;

    // devastated
    backgroundDevastated = loadImage("Background_Devastated.png");
    partialBackDev = null;
    devastating = "hundreds of years later...";
    dialogue1_1 = "Now that,";
    dialogue1_2 = "all the animals are gone,";
    dialogue2 = "Who is next?";
    p = null;
    
    pgE_y_speed = 2f;
  }

  /////////////
  // methods //
  /////////////

  // for condition 1
  // void gather() {
  //   d
  // }

  // for condition 2
  // it takes 0-1 domain and returns 0-1
  private float shutterFunction(float par) {
    float ret;
    if(par <= 0.5f) ret = 4*par*par;  // for domain 0-0.5
    else ret = 2 / (MAX_BRIGHTNESS - 1) * (par - 1) * (par - 1) - 0.8 / (MAX_BRIGHTNESS - 1);  // for domain 0.5-1
    // println(ret);
    return ret;
  }

  void takePicture() {
    // screen : go bright -> go dark for some degrees.
    if(shutter < 1) {
      // make image
      if(backgroundPicture == null) {
        loadPixels();
        backgroundPicture = createImage(width, height, RGB);
        backgroundPicDestination = createImage(width, height, RGB);
        backgroundPicture.loadPixels();
        for(int y = 0; y < height; y++) {
          for(int x = 0; x < width; x++) {
            int loc = x + y * width;
            backgroundPicture.pixels[loc] = pixels[loc];
          }
        }
        backgroundPicture.updatePixels();
        // println("ImageCreated");
      }
      // bright change
      shutter += shutterSpeed;
      brightness_Background = map(shutterFunction(shutter), 0, 1, 1, MAX_BRIGHTNESS);
      // println(brightness_Background);
      loadPixels();
      backgroundPicture.loadPixels();
      for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
          int loc = x + y * width;
          float r = red(backgroundPicture.pixels[loc]) * brightness_Background;
          float g = green(backgroundPicture.pixels[loc]) * brightness_Background;
          float b = blue(backgroundPicture.pixels[loc]) * brightness_Background;
          r = constrain(r, 0, 255);
          g = constrain(g, 0, 255);
          b = constrain(b, 0, 255);
          pixels[loc] = color(r, g, b);
        }
      }
      updatePixels();
    }
    else {
      loadPixels();
      backgroundPicDestination.loadPixels();
      for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
          int loc = x + y * width;
          backgroundPicDestination.pixels[loc] = pixels[loc];
        }
      }
      backgroundPicDestination.updatePixels();
      delay(500);
      pushMatrix();
      translate(width/2,height/2);
      image(animalsPicture, 0, 0);
      popMatrix();
      condition = 3;
    }
  }

  // for condition 3
  void monologue() {
    pushMatrix();
    translate(width/2,height/2);
    if(pg_Monologue == null) {
      pg_Monologue = createGraphics(width,height*2);
      pg_Monologue.beginDraw();
      pg_Monologue.pushMatrix();
      pg_Monologue.translate(width/2, height);
      pg_Monologue.imageMode(CENTER);
      pg_Monologue.image(animalsPicture, 0, 0);
      pg_Monologue.textAlign(CENTER);
      pg_Monologue.textFont(fontMsg);
      pg_Monologue.textSize(50);
      pg_Monologue.text(monologue11, 0, 500);
      pg_Monologue.text(monologue12, 0, 560);
      pg_Monologue.text(monologue21, 0, 660);
      pg_Monologue.text(monologue22, 0, 720);
      pg_Monologue.text(monologue3, 0, 820);
      pg_Monologue.popMatrix();
      pg_Monologue.endDraw();
      delay(1000);
    }
    if(pg_y > MAX_PG_Y) {
      backgroundPicDestination.loadPixels();
      for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
          int loc = x + y * width;
          float r = red(backgroundPicDestination.pixels[loc]) * 0.95;
          float g = green(backgroundPicDestination.pixels[loc]) * 0.95;
          float b = blue(backgroundPicDestination.pixels[loc]) * 0.95;

          backgroundPicDestination.pixels[loc] = color(r, g, b);
        }
      }
      backgroundPicDestination.updatePixels();
      image(backgroundPicDestination, 0, 0);
      image(pg_Monologue, 0, pg_y);
      pg_y -= pg_y_speed;
    }
    else if(pg_y > 2 * MAX_PG_Y) {
      pg_y -= pg_y_speed;
      textSize(40);
      textAlign(CENTER);
      text(devastating, 0, 0);
    }else {
      
      condition = 4;
    }
    popMatrix();
      
    
    
  }

  // for condition 4
  void devastated() {
    pushMatrix();
    translate(width/2, height/2);
    
    if(partialBackDev == null) {
      partialBackDev = createImage(width, height, RGB);
      partialBackDev.loadPixels();
      backgroundDevastated.loadPixels();
      for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
          int locBG = x + BACKGROUND_WIDTH/2 + 200 + (y + BACKGROUND_HEIGHT/2 - 2000) * backgroundDevastated.width;
          int loc = x + y * width;
          partialBackDev.pixels[loc] = backgroundDevastated.pixels[locBG];
        }
      }
      partialBackDev.updatePixels();

      // Person
      p = new Person(-200, 0);
      p.addBoundaryVertex(-200, -300);
      p.addBoundaryVertex(-200, 300);
      p.addBoundaryVertex(200, 300);
      p.addBoundaryVertex(200, -300);
    }
    image(partialBackDev, 0, 0);
    if(p.isClicked) p.face_condition++;
    println(p.face_condition);
    p.drawAnimal();
    if(p.face_condition > 2 && p.face_condition <= 4) {
      // word
      textFont(fontMsg);
      textAlign(CORNER);
      textSize(55);
      text(dialogue1_1,-50,-100);
      text(dialogue1_2,-50,-50);
    }else if(p.face_condition > 4){
      condition = 5;
    }
    //p.showBoundary();
    popMatrix();
  }

  // for condition
  void endingMsg() {
      background(0);
      textAlign(CORNER);
      textFont(fontHuman);
      textSize(150);
      fill(196,11,19);
      text(dialogue2,width/2+50,height/2+50);
      
      pushMatrix();
      translate(width/4,height/2);
      if(pg_Ending==null){
        pg_Ending = createGraphics(width,height*2);
        pg_Ending.beginDraw();
        pg_Ending.pushMatrix();
        pg_Ending.translate(width/2, height);
        pg_Ending.textAlign(CENTER);
        pg_Ending.textFont(fontMsg);
        pg_Ending.textSize(30);
        pg_Ending.text("We created this program to promote", 0, 400);
        pg_Ending.text("endangered species living in our country", 0, 440);
        pg_Ending.text("and ask you to participate in activities to protect them.", 0, 480);
        pg_Ending.text("- Ajou Univ. Creative Media Programming, 2022 Fall.", 0, 580);
        pg_Ending.text("20227178 Lee Yongkyu", 0, 680);
        pg_Ending.text("202127238 Yange Eunseo", 0, 720);
        pg_Ending.text("202127243 Nam Eunsu", 0, 760);
        pg_Ending.text("202127252 Um Chaeyoon", 0, 800);
        pg_Ending.popMatrix();
        pg_Ending.endDraw();
        delay(1000);
      }
      if(pgE_y > MAX_PGE_Y) {
      image(pg_Ending, 0, pgE_y);
      pgE_y -= pgE_y_speed;
    }else {
      condition=6;
    }
    
    popMatrix();
    
  }
  
  void endingFin(){
    background(0);
    delay(1000);
    
    textFont(fontHuman);
    textSize(300);
    fill(196,11,19);
    textAlign(CENTER);
    text(dialogue2,width/2,height/2+100);
  }

  // isEnd면 run을 실행
  void run() {
    if(condition == 1) {
      // gather();
    } else if(condition == 2) {
      takePicture();
    } else if(condition == 3) {
      monologue();
    } else if(condition == 4) {
      devastated();
    } else if(condition == 5) {
      endingMsg();
    } else if(condition == 6){
      endingFin(); 
    }
  }

  boolean personClick(int mx, int my) {
    if(p == null) return false;
    boolean ret = p.isMouseOn(mx, my);

    if(ret == false) return ret;
    
    // mouse clicked the person
    //println(mx + ", " + my);
    p.face_condition++;

    return ret;
  }
}
