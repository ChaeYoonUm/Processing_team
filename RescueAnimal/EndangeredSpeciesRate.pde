// Written by Eom Chae Yoon

class EndangeredSpeciesRateAPI {
  /////////////
  // methods //
  /////////////

  void drawAPI(){
    String[] lines = loadStrings("https://www.theworldcounts.com/embeds/counters/66");
    // println("there are " + lines.length + " lines");
    String line = lines[lines.length-14];
    line = line.substring(18, 29) + "%";
    pushMatrix();
    translate(width/2, height-20);

    textAlign(CENTER);
    textSize(40);
    text(line, 0, 0);

    popMatrix();
  }

}
