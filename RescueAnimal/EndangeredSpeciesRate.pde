// Written by Eom Chae Yoon

class EndangeredSpeciesRateAPI {

  ///////////////
  // variables //
  ///////////////

  String[] lines;
  String line;
  int updateDelay;


  //////////////////
  // constructors //
  //////////////////

  EndangeredSpeciesRateAPI() {
    lines = loadStrings("https://www.theworldcounts.com/embeds/counters/66");
    line = lines[lines.length-14];
    line = line.substring(18, 29) + "%";
    updateDelay = 100;
  }

  /////////////
  // methods //
  /////////////

  void drawAPI(){
    if(updateDelay > 100){
      lines = loadStrings("https://www.theworldcounts.com/embeds/counters/66");
      line = lines[lines.length-14];
      updateDelay = 0;
      line = line.substring(18, 29) + "%";
      println("UPdate");
    }

    pushMatrix();
    translate(width/2, height-20);

    textAlign(CENTER);
    textSize(40);
    text(line, 0, 0);

    popMatrix();

    updateDelay++;
  }

}
