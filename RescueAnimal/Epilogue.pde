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
  PImage backgroundDevastated;
  String devastating, dialogue1, dialogue2;
  Person p;

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
    pg_y_speed = 2f;

    // devastated
    backgroundDevastated = loadImage("Background_Devastated");
    devastating = "hundreds of years later...";
    dialogue1 = "Now that all the animals are gone,";
    dialogue2 = "Who is next?";
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
      pg_Monologue.textSize(40);
      pg_Monologue.text(monologue11, 0, 500);
      pg_Monologue.text(monologue12, 0, 540);
      pg_Monologue.text(monologue21, 0, 640);
      pg_Monologue.text(monologue22, 0, 680);
      pg_Monologue.text(monologue3, 0, 780);
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
    else {
      condition = 4;
    }
    popMatrix();
  }

  // for condition 4
  void devastated() {

  }

  // for condition
  void endingMsg() {
    // d
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
    }
  }
}
