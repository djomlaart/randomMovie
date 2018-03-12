import processing.video.*;
import deadpixel.keystone.*;

Movie currentMovie;
String intro= "/Users/mladenlazarevic/Desktop/tesla_test/A01.mov";
String[] A = {"/Users/mladenlazarevic/Desktop/tesla_test/COLOVIC 01.mov", "/Users/mladenlazarevic/Desktop/tesla_test/karan 01.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/ntesla 01.mov"};
String[] B = {"/Users/mladenlazarevic/Desktop/tesla_test/COLOVIC 02.mov", "/Users/mladenlazarevic/Desktop/tesla_test/karan 02.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/ntesla 02.mov"};
String[] C = {"/Users/mladenlazarevic/Desktop/tesla_test/COLOVIC 03.mov", "/Users/mladenlazarevic/Desktop/tesla_test/karan 03.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/ntesla 03.mov"};

String[][][] Formulas= {{A, B, C}, {A, A, B}, {B, C}};

void setup() {
  //fullScreen();
  frameRate(30);
   
  
  currentMovie = new Movie(this, intro);
  currentMovie.play();
}


void draw() {
  
  /* i should probably move read in somewhere else */
  if (currentMovie.available()) {
    currentMovie.read();
  }
  image(currentMovie, 0,0);
}

void mousePressed() {
    for (int i = 0; i < Formulas[0].length; i++) {
      currentMovie = new Movie(this, Formulas[0][i][1]);
      currentMovie.play();
}
    
}


/*
"A = [ddsda, dadad, adada]
"B= [dadada, dadad, adada]
"c= [dadada, dadad, dadad]

"Formulas = [[A, B, C],
"            [A, A, B],
"            [B, C]
"]




"while True:
"  shuffle, a, b, c
"  for i to len(Formulas(rand*3)):
"          play(i)
*/