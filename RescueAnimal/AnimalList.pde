// Written by Yang Eun Seo, Nam Eun Su, Eom Chae Yoons

class animalList{

PImage QM1, QM2, iB, Ww, Bm, Rt, Bear, Bird, Fish, Ig, instruction, Noru, Gae, Nam, Frog, Gasi, Mea, Doromi, Sak, Free, How;
PImage NoruF, GaeF, NamF, FrogF, GasiF, MeaF, DoromiF, SakF;
PImage NoruD, GaeD, NamD, FrogD, GasiD, MeaD, DoromiD, SakD;
PImage noru_button,mae_button,sak_button,frog_button,crab_button,gasi_button,duru_button,nam_button;
PImage firAniImg,secAniImg;

boolean Q1size = true;
boolean Q2size = false;

boolean al1 = true;
boolean al2 = false;
boolean al3 = false;
boolean al4 = false;

//boolean Tada = false; //창 열기(->이렇게 생긴 거) (여기서는 al들을 다룬다.)
boolean Bsize = false; //Bottom 사이즈 (창 열면 작은 사이즈, 아니면 큰 사이즈 / 여기서는 기본 조작 버튼을 다룬다.)
boolean Freee = true; // 왼쪽 위 ? 모양 (시작할 때 사용설명서 띄우기)

boolean[] col;

// Background Capture
PImage backgroundCapture;

void AL_mousePressed() {
  if(1428<mouseX&&mouseX<1492) {
    if(394<mouseY&&mouseY<506) {
      Bsize = true;
    }
  }
  if(918<mouseX&&mouseX<983) {
    if(394<mouseY&&mouseY<506)
      Bsize = false;
  }
  if(17<mouseX&&mouseX<83) {
    if(17<mouseY&&mouseY<83) {
      if(Freee == false)
      Freee = true;
      else if(Freee == true)
      Freee = false;
    }
  }
}

void AL_keyPressed() {
  if(key == CODED) {
    // f1's ASCII code is 112
    if(keyCode == 112) {
      if(Q1size == false) {
      Q1size = true;  Q2size = false;
      }
    }
  }
    if(key == CODED) {
    // f1's ASCII code is 113
    if(keyCode == 113) {
      if(Q2size == false) {
      Q2size = true;  Q1size = false;
      }
    }
  }

  if(key == '1') {
    if(al1 == false) {
      al1 = true; al2 = false; al3 = false; al4 = false;
      }
  }
  else if(key == '2') {
    if(al2 == false) {
      al1 = false; al2 = true; al3 = false; al4 = false;
      }
  }
  else if(key == '3') {
    if(al3 == false) {
      al1 = false; al2 = false; al3 = true; al4 = false;
      }
  }
  else if(key == '4') {
    if(al4 == false) {
      al1 = false; al2 = false; al3 = false; al4 = true;
      }
    }
}

void AL_setup() {
  QM1 = loadImage("QuestionMark1.png");
  QM2 = loadImage("QuestionMark2.png");
  iB = loadImage("instructionB.png");
  Ww = loadImage("window.png");
  Bm = loadImage("Bottom.png");
  Rt = loadImage("Right.png");
  Bear = loadImage("bear.png");
  Bird = loadImage("bird.png");
  Fish = loadImage("fish.png");
  Ig = loadImage("ig.png");
  instruction = loadImage("instruction.png");
  Noru = loadImage("noru.png");
  Gae = loadImage("gae.png");
  Nam = loadImage("nam.png");
  Frog = loadImage("frog.png");
  Gasi = loadImage("gasi.png");
  Mea = loadImage("mea.png");
  Doromi = loadImage("doromi.png");
  Sak = loadImage("sak.png");
  NoruD = loadImage("noruD.png");
  SakD = loadImage("sakD.png");
  How = loadImage("howto.png");
  NoruF = loadImage("noruF.png");
  GaeF = loadImage("gaeF.png");
  NamF = loadImage("namF.png");
  FrogF = loadImage("frogF.png");
  GasiF = loadImage("gasiF.png");
  MeaF = loadImage("meaF.png");
  DoromiF = loadImage("doromiF.png");
  SakF = loadImage("sakF.png");
  NoruD = loadImage("noruD.png");
  GaeD = loadImage("gaeD.png");
  NamD = loadImage("namD.png");
  FrogD = loadImage("frogD.png");
  GasiD = loadImage("gasiD.png");
  MeaD = loadImage("meaD.png");
  DoromiD = loadImage("doromiD.png");
  SakD = loadImage("sakD.png");

  nam_button=loadImage("nam_button.png");
  sak_button=loadImage("sak_button.png");
  noru_button=loadImage("noru_button.png");
  duru_button=loadImage("duru_button.png");
  frog_button=loadImage("frog_button.png");
  crab_button=loadImage("crab_button.png");
  mae_button=loadImage("mae_button.png");
  gasi_button=loadImage("gasi_button.png");

  firAniImg=QM1;
  secAniImg=QM2;

  col = new boolean[8];
}

void AL_draw() {

  imageMode(CENTER);
  image(Ww, width/2, height/2);
  image(Rt, 230, 420);

  if(Q1size==true) {
    pushMatrix();
    translate(230,320);
    scale(1);
    noTint();
    image(firAniImg, 0, 0);
    popMatrix();
  }
   else if(Q1size==false) {
     pushMatrix();
     translate(234,324);
    scale(0.65);
    tint(255, 150);
    image(firAniImg, 0, 0);
    popMatrix();
   }
   if(Q2size==false) {
     pushMatrix();
     translate(234,524);
     scale(0.65);
     tint(255, 150);
     image(secAniImg, 0, 0);
     popMatrix();
  }
  else if(Q2size==true) {
    pushMatrix();
    translate(230,560);
   scale(1);
   noTint();
   image(secAniImg, 0, 0);
   popMatrix();
  }

  if(Bsize == false) {//창 닫혔을때

    pushMatrix();
    translate(800, 700);
    scale(1);
    noTint();
    image(Bm, 0, 0);
    popMatrix();

  if(al1 == true) {
    pushMatrix();
    translate(450, 700);
    scale(1);
    noTint();
    image(Ig, 0, 0);
    popMatrix();
  }
  else if(al1 == false) {
    pushMatrix();
    translate(460, 704);
    scale(0.65);
    tint(255, 150);
    image(Ig, 0, 0);
    popMatrix();
  }
  if(al2 == true) {
    pushMatrix();
    translate(683, 704);
    scale(1);
    noTint();
    image(Bear, 0, 0);
    popMatrix();
  }
  else if(al2 == false) {
    pushMatrix();
    translate(683, 704);
    scale(0.65);
    tint(255, 150);
    image(Bear, 0, 0);
    popMatrix();
  }
  if(al3 == true) {
    pushMatrix();
    translate(917, 704);
    scale(1);
    noTint();
    image(Fish, 0, 0);
    popMatrix();
  }
  else if(al3 == false) {
    pushMatrix();
    translate(917, 704);
    scale(0.65);
    tint(255, 150);
    image(Fish, 0, 0);
    popMatrix();
  }
  if(al4 == true) {
    pushMatrix();
    translate(1150, 704);
    scale(1);
    noTint();
    image(Bird, 0, 0);
    popMatrix();
  }
  else if(al4 == false) {
    pushMatrix();
    translate(1150, 704);
    scale(0.65);
    tint(255, 150);
    image(Bird, 0, 0);
    popMatrix();
  }

    pushMatrix();
  translate(1460, 450);
   scale(1);
   noTint();
   image(iB, 0, 0);
   popMatrix();

   if(al1==true){
     if(col[4]==false)
     firAniImg=QM1;
     else if(col[4]==true)
     firAniImg=nam_button;

     if(col[7] == false)
       secAniImg=QM2;
      else if(col[7] == true)
      secAniImg=frog_button;

     if(Q1size==true){
       pushMatrix();
      translate(550, 400);
      scale(1);
      if(col[4] == false)
        image(Nam, 300, 0);
      else if(col[4] == true)
        image(NamF, 300, 0);
      popMatrix();
     }
     if(Q2size==true){
       pushMatrix();
      translate(550, 400);
      scale(1);
      if(col[7] == false){
      image(Frog, 250, 0);
      }
      else if(col[7] == true){
      image(FrogF, 250, 0);
      }
      popMatrix();
     }

   }else if(al2==true){
     if(col[5] == false)
     firAniImg=QM1;
     else if(col[5] == true)
     firAniImg=noru_button;

     if(col[6] == false)
     secAniImg=QM2;
     else if(col[6] == true)
     secAniImg=sak_button;

     if(Q1size==true){
       pushMatrix();
      translate(550, 400);
      scale(1);
      if(col[5] == false){
      image(Noru, 200, 0);
      }
      else if(col[5] == true){
      image(NoruF, 200, 0);
      }
      popMatrix();
     }
     if(Q2size==true){
       pushMatrix();
      translate(550, 400);
      scale(1);
      if(col[6] == false)
      image(Sak, 250, 0);
      else if(col[6] == true){
      image(SakF, 250, 0);
      }
      popMatrix();
     }

   }else if(al3==true){
     if(col[0] == false)
     firAniImg=QM1;
     else if(col[0] == true)
     firAniImg=crab_button;

     if(col[2] == false)
     secAniImg=QM2;
     else if(col[2] == true)
     secAniImg=gasi_button;

     if(Q1size==true){
       pushMatrix();
      translate(550, 400);
      scale(2);
      if(col[0] == false){
      image(Gae, 125, 0);
      }
      else if(col[0] == true){
      image(GaeF, 125, 0);
      }
      popMatrix();
     }
     if(Q2size==true){
       pushMatrix();
      translate(550, 400);
      scale(0.4);
      if(col[2] == false){
      image(Gasi, 650, 100);
      }
      else if(col[2] == true){
      image(GasiF, 650, 100);
      }
      popMatrix();
     }
   }else if(al4==true){
     if(col[1] == false)
     firAniImg=QM1;
      else if(col[1] == true)
      firAniImg=duru_button;

      if(col[3] == false)
      secAniImg=QM2;
       else if(col[3] == true)
         secAniImg=mae_button;

       if(Q1size==true){
       pushMatrix();
      translate(550, 400);
      scale(0.7);
      if(col[1] == false){
      image(Doromi, 370, 0);
      }
      else if(col[1] == true){
      image(DoromiF, 370, 0);
      }
      popMatrix();
     }
     if(Q2size==true){
       pushMatrix();
      translate(550, 400);
      scale(1);
      if(col[3] == false){
      image(Mea, 200, 0);
      }
      else if(col[3] == true){
      image(MeaF, 200, 0);
      }
      popMatrix();
     }
   }
  }
  /////////////////
  else if(Bsize == true) { // 창이 열림

  pushMatrix();
  translate(600, 700);
  scale(0.8);
  noTint();
  image(Bm, 0, 0);
  popMatrix();

  pushMatrix();
    translate(1230, 450);
    scale(1);
    noTint();
    image(instruction, 0, 0);
    popMatrix();

  if(al1 == true) {
    pushMatrix();
    translate(330, 704);
    scale(0.64);
    noTint();
    image(Ig, 0, 0);
    popMatrix();
  }
  else if(al1 == false) {
    pushMatrix();
    translate(330, 704);
    scale(0.512);
    tint(255, 150);
    image(Ig, 0, 0);
    popMatrix();
  }
  if(al2 == true) {
    pushMatrix();
    translate(513, 704);
    scale(0.64);
    noTint();
    image(Bear, 0, 0);
    popMatrix();
  }
  else if(al2 == false) {
    pushMatrix();
    translate(513, 704);
    scale(0.512);
    tint(255, 150);
    image(Bear, 0, 0);
    popMatrix();
  }
  if(al3 == true) {
    pushMatrix();
    translate(697, 704);
    scale(0.64);
    noTint();
    image(Fish, 0, 0);
    popMatrix();
  }
  else if(al3 == false) {
    pushMatrix();
    translate(697, 704);
    scale(0.512);
    tint(255, 150);
    image(Fish, 0, 0);
    popMatrix();
  }
  if(al4 == true) {
    pushMatrix();
    translate(880, 704);
    scale(0.64);
    noTint();
    image(Bird, 0, 0);
    popMatrix();
  }
  else if(al4 == false) {
    pushMatrix();
    translate(880, 704);
    scale(0.512);
    tint(255, 150);
    image(Bird, 0, 0);
    popMatrix();
  }
     pushMatrix();
    translate(1230, 450);
    scale(1);
    noTint();
    image(instruction, 0, 0);
    popMatrix();

   pushMatrix();
   translate(950, 450);
   scale(1);
   noTint();
   image(iB, 0, 0);
   popMatrix();

if(al1==true){
  if(col[4]==false)
      firAniImg=QM1;
    else if(col[4]==true)
      firAniImg=nam_button;

    if(col[7] == false)
       secAniImg=QM2;
      else if(col[7] == true)
        secAniImg=frog_button;

  if(Q1size==true){
    pushMatrix();//남생이
      translate(450, 450);
      scale(0.65);
      if(col[4] == false){
      image(Nam, 300, -80);
      }
      else if(col[4] == true)
      image(NamF, 300, -80);

      popMatrix();
if(col[4]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(NamD, 0, 0);
      popMatrix();
    }
  }
  else if(Q2size==true){
    if(al1 == true) {//개구리
      pushMatrix();
      translate(450, 450);
      scale(0.65);
      if(col[7] == false)
        image(Frog, 250, -80);
      else if(col[7] == true)
        image(FrogF, 250, -80);
      popMatrix();
    }
if(col[7]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(FrogD, 0, 0);
      popMatrix();
    }
  }
}
else if(al2==true){
  if(col[5] == false)
     firAniImg=QM1;
  else if(col[5] == true)
     firAniImg=noru_button;

  if(col[6] == false)
     secAniImg=QM2;
  else if(col[6] == true)
     secAniImg=sak_button;

  if(Q1size==true){
      pushMatrix();//노루
      translate(450, 450);
      scale(0.65);
      if(col[5] == false)
        image(Noru, 200, -80);
      else if(col[5] == true)
        image(NoruF, 200, -80);
      popMatrix();

      if(col[5]==true){
        pushMatrix();
        translate(1225, 450);
        scale(0.9);
        image(NoruD, 0, 0);
        popMatrix();
    }
  }
  else if(Q2size==true){
      pushMatrix();//삵
      translate(450, 450);
      scale(0.65);
      if(col[6] == false)
        image(Sak, 250, -80);
      else if(col[6] == true)
        image(SakF, 250, -80);
      popMatrix();

      if(col[6]==true){
        pushMatrix();
        translate(1225, 450);
        scale(0.9);
        image(SakD, 0, 0);
        popMatrix();
      }
   }
}
else if(al3==true){
  if(col[0] == false)
     firAniImg=QM1;
  else if(col[0] == true)
     firAniImg=gasi_button;

  if(col[2] == false)
     secAniImg=QM2;
  else if(col[2] == true)
     secAniImg=gasi_button;

  if(Q1size==true){
     pushMatrix();
      translate(450, 450);
      scale(1.3);
      if(col[0] == false)
        image(Gae, 125, -50);
      else if(col[0] == true)
        image(GaeF, 125, -50);
      popMatrix();

  if(col[0]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(GaeD, 0, 0);
      popMatrix();
    }
 }
 else if(Q2size==true){
      pushMatrix();
      translate(450, 450);
      scale(0.26);
      if(col[2] == false)
        image(Gasi, 650, 20);
      else if(col[2] == true)
        image(GasiF, 650, 20);
      popMatrix();

      if(col[2]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(GasiD, 0, 0);
      popMatrix();
    }
 }
}
else if(al4==true){
 if(col[1] == false)
     firAniImg=QM1;
 else if(col[1] == true)
     firAniImg=duru_button;

   if(col[3] == false)
      secAniImg=QM2;
   else if(col[3] == true)
      secAniImg=mae_button;

  if(Q1size==true){
      pushMatrix();
      translate(450, 450);
      scale(0.455);
      if(col[1] == false)
        image(Doromi, 340, -80);
      else if(col[1] == true)
        image(DoromiF, 340, -80);
      popMatrix();

if(col[1]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(DoromiD, 0, 0);
      popMatrix();
    }
    }
  else if(Q2size==true){
     pushMatrix();
      translate(450, 450);
      scale(0.65);
      if(col[3] == false)
        image(Mea, 200, -80);
      else if(col[3] == true)
        image(MeaF, 200, -80);
      popMatrix();

if(col[3]==true){
      pushMatrix();
      translate(1225, 450);
      scale(0.9);
      image(MeaD, 0, 0);
      popMatrix();
    }
  }
}
noTint();
}


 if(Freee == true) { //게임 조작 이용 방법 ? 버튼
    pushMatrix();
  translate(width/2+22, height/2);
  scale(1);
  noTint();
  image(How, 0, 0);
  popMatrix();
  }
}

}
