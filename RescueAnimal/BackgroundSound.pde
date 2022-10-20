import processing.sound.*;
SoundFile sound;
Sound s;
float e = 0.0;
float vol = 1;

void setup(){
   size(200,200);
   sound = new SoundFile(this, "sound.wav");
   s = new Sound(this);
   sound.loop();
}

void draw(){
  vol += -e*0.1f;
  vol = constrain(vol, 0, 1);
  
  s.volume(vol);
  
}

void mouseWheel(MouseEvent event){
    e += event.getCount();
}
