import processing.video.*;
import deadpixel.keystone.*;


//ArrayList<Movie>   moviesPlaying = new ArrayList<Movie>();
String intro= "/Users/mladenlazarevic/Desktop/tesla_test/A01.mov";
String[] A = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 01.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 01.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 01.mov"};
String[] B = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 02.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 02.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 02.mov"};
String[] C = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 03.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 03.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 03.mov"};

String[][][] Formulas= {{A, B, C}, {A, A, B}, {B, C}};
Movie[] playlist = new Movie[3];  
Movie currentMovie;
int index = 0; 
int fIndex = 0;

void setup() {
  fullScreen();
  frameRate(30);
  
  playlist=newFormula();
  index=0;
  playlist[index].play();
}


void draw() {
  
  /* i should probably move read in somewhere else */
  /*if (currentMovie.available()) {
    currentMovie.read();
  }
  */
  image(playlist[index], 0,0);
}

void mousePressed() {
    for (int i = 0; i < Formulas[0].length; i++) {
      currentMovie = new Movie(this, Formulas[0][i][1]);
      currentMovie.play();
    }
  }

void movieEvent(Movie m) {
  m.read();
  
  if( m.time() >= m.duration() ) {
    print("movie_end");
    // fix this later
    if (index<3){
      index+=1;
      playlist[index].play();
    }
    else{
      playlist=newFormula();
      index=0;
      playlist[index].play();
    }
    
  }
}
    
// function that is called when we come to the end of one of the formulas
// we call this to randomly pick a new formula and initialize new list of movies
Movie[] newFormula(){
  // pick random formula
  fIndex = int(random(Formulas.length));
  
  // initialie new playlist
  // fix this
  for (int i = 0; i < Formulas[fIndex].length; i++) {
      playlist[i] = new Movie(this, Formulas[0][i][1]);
    }
    
  return playlist;
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