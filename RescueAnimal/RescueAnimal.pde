// test code
Map m;
void setup() {
  size(1600, 900);
  m = new Map();
  m.addBoundaryVertex(0, 0);
  m.addBoundaryVertex(100, 100);
}

void draw() {
  background(255);
  stroke(0);
  m.drawBoundary();
}


void mouseClicked() {
  if(m.isMouseOn(mouseX, mouseY)) {
    println("Test");
  }
}
