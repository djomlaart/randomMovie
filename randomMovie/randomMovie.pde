import processing.video.*;
import deadpixel.keystone.*;


//ArrayList<Movie>   moviesPlaying = new ArrayList<Movie>();
String intro= "/Users/mladenlazarevic/Desktop/tesla_test/A01.mov";
String[] A = {"nula", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 01.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 01.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 01.mov", "nula"};
String[] B = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 02.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 02.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 02.mov", "nula"};
String[] C = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 03.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 03.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 03.mov", "nula"};

String[][][] Formulas= {{A, B, C}, {C, A, B}, {B, C, A}};
ArrayList<Movie> playlist = new ArrayList<Movie>();  
Movie currentMovie;
int index = 0; 
int fIndex = 0;
float movieEndDuration = 0.049719;//a 'magic number' helpful to find out when a movie finishes playing




void setup() {
  fullScreen();
  frameRate(30);
  
  playlist=newFormula();
  index=0;
  playlist.get(index).play();
}




void draw() {
  
  /* i should probably move read in somewhere else */
  /*if (currentMovie.available()) {
    currentMovie.read();
  }
  */
  image(playlist.get(index), 0,0);
}




void movieEvent(Movie m) {
  m.read();
  
  // here i'm just cheking if it's the end of the movie
  print(m.time());
  print(m.duration());
  if( m.time() + movieEndDuration>= m.duration() ) {
    print("movie_end");
    // if we've havent reached end of the formula/list, we just play next video from the formula/list
    if (index<playlist.size()-1){
      print("next");
      index+=1;
      playlist.get(index).play();
    }
    
    // if the video which had ended was last in the formula, we randomly pick the new formula
    else{
      playlist=newFormula();
      print("newformula");
      index=0;
      print(playlist);
      playlist.get(index).play();
    } 
  }
}
 
 
 
// function that is called when we come to the end of one of the formulas
// we call this to randomly pick a new formula and initialize new list of movies
ArrayList<Movie> newFormula(){
  // pick random formula

  fIndex = int(random(Formulas.length));
  
  //delete all existing elements of the list
  for (int i = playlist.size() - 1; i >= 0; i--) {
    playlist.remove(i);
  }
  
  // initialize new playlist
  // fix this
  for (int i = 0; i < Formulas[fIndex].length; i++) {
    if (Formulas[fIndex][i][0] != "nula"){
      Movie m = new Movie(this, Formulas[fIndex][i][0]);
      playlist.add(m);
    }
    else
    {print("nula");}
    }
  
  print("return");
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