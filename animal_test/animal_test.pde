PImage body, head, line;
float armAngle = radians(-45);

void setup() {
  size(400, 400);
  body = loadImage("body.png");
  head = loadImage("head.png");
  line = loadImage("line.png");
}

void draw() {
  background(127);
  pushMatrix();
  translate(width/2, height/2);
  image(body, -(body.width)/2, -50);
  image(head, -(head.width)/2, -150);

  // arm
  pushMatrix();
  translate((body.width)/2,0);
  rotate(armAngle);
  image(line, 0, 0);
  popMatrix();

  pushMatrix();
  translate(-(body.width)/2,0);
  rotate(-armAngle);
  image(line, 0, 0);
  popMatrix();

  popMatrix();

  armAngle += radians(1);
}
