PImage img;
float x,y;

void setup(){
size(1600,900);
img=loadImage("bg.png");
x=0;
y=0;
}

void draw(){
 image(img,-x,-y); 
 println(x,y);
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
     y-=200; 
    }else if(keyCode==DOWN){
     y+=200; 
    }else if(keyCode==LEFT){
     x-=200; 
    }else if(keyCode==RIGHT){
     x+=200; 
    }
  }
   x=constrain(x,0,8000);
 y=constrain(y,0,4500);
}
