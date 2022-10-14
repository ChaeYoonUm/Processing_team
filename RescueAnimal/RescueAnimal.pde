// test code
Map m;
Mae mae;
void setup() {
  size(1600, 900);
  m = new Map();
  m.addBoundaryVertex(0, 0);
  m.addBoundaryVertex(100, 100);

  mae = new Mae(width/2, height/2);
}

void draw() {
  background(255);
  stroke(0);
  m.drawBoundary();

  mae.drawAnimal();
}


void mouseClicked() {
  if(m.isMouseOn(mouseX, mouseY)) {
    println("Test");
  }
}
