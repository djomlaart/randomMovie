import processing.video.*;
import deadpixel.keystone.*;
import java.util.Collections;
import java.util.Random;



//ArrayList<Movie>   moviesPlaying = new ArrayList<Movie>();
String naslov= "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 01.mov";
String[] A = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 01.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 01.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 01.mov", "nula"};
String[] B = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 02.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 02.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 02.mov", "nula"};
String[] C = {"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/COLOVIC 03.mov", "/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/karan 03.mov",
"/Users/mladenlazarevic/Desktop/tesla_test/randomScreenplay/ntesla 03.mov", "nula"};


String[][][] Formulas= {{A, A, A}, {C, C, B}, {B, B, A}};
String[][] sFormulas= {{"A", "A", "A"}, {"C", "C", "B"}, {"B", "B", "A"}};


/*

String[][][] Formulas= {{A, A, A, B, C, D, E, F, G, H}, 
              {H, B, C, D, E, E, A, G, G, G, F},
              {H,B,C,D,G,A,E,F,G,H},
              {A,B,A,C,D,E,F,G,H},
              {A,B,C,D,E,F,G,H},
              {A,D,D,D,B,C,E,F,F,G,G,G,H}, 
              {C,C,C,A,B,B,G,E,E,E,E,D,D,D,D,D,D,D,F,H}};


String[][] sFormulas= {{"A","A","A","B","C","D","E","F","G","H"},
                      {"H","B","C","D","E","E","A","G","G","G","F"},
                      {"H","B","C","D","G","A","E","F","G","H"},
                      {"A","B","A","C","D","E","F","G","H"},
                      {"A","B","C","D","E","F","G","H"},
                      {"A","D","D","D","B","C","E","F","F","G","G","G","H"},
                      {"C","C","C","A","B","B","G","E","E","E","E","D","D","D","D","D","D","D","F","H"}};

*/

ArrayList<Movie> playlist = new ArrayList<Movie>();  
Movie currentMovie;
int index = 0; 
int fIndex = 0;
float movieEndDuration = 0.049719;//a 'magic number' helpful to find out when a movie finishes playing

IntDict tracking;




void setup() {
  fullScreen(JAVA2D);
  frameRate(30);
  
  tracking = new IntDict();
  
  tracking.set("A", 0); 
  tracking.set("B", 0); 
  tracking.set("C", 0);
  tracking.set("D", 0); 
  tracking.set("E", 0); 
  tracking.set("F", 0); 
  tracking.set("G", 0); 
  tracking.set("H", 0); 
  
  playlist=newFormula();
  index=0;
  playlist.get(index).play();
  
  noLoop();
}




void draw() {
  background(0);
  
  /* i should probably move read in somewhere else */
  /*if (currentMovie.available()) {
    currentMovie.read();
  }
  */
  
  // need to add this if in case list is empty
  if(playlist.size()>0 && playlist.size()> index)
  {
    image(playlist.get(index), 0,0);
  }
}




void movieEvent(Movie m) {
  if (m.available()){
      m.read();
      redraw=true;
  }

  
  // here i'm just cheking if it's the end of the movie
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
  print("formula index");
  print(fIndex);
  
  //delete all existing elements of the list
  for (int i = playlist.size() - 1; i >= 0; i--) {
    playlist.remove(i);
  }
  
  
  shuffle();
  
 // add this because of intro (naslov)
 Movie m =  new Movie(this, naslov);
  playlist.add(m); 
  
  // fill out the rest of the playlist
  for (int i = 0; i < Formulas[fIndex].length; i++) {
    print(i);
    if(Formulas[fIndex][i][tracking.get(sFormulas[fIndex][i])] != "nula"){
      print("nije nula");
      m = new Movie(this, Formulas[fIndex][i][tracking.get(sFormulas[fIndex][i])]);
      playlist.add(m);
    }
    else
    {
      print("nula");
    }
    
    // track when video from one of the group was played
    tracking.increment(sFormulas[fIndex][i]);
    print(tracking);
  }
  
  print("return");
  return playlist;
}



void shuffleArray(String[] array) {
 
  // with code from WikiPedia; Fisher–Yates shuffle 
  //@ <a href="http://en.wikipedia.org/wiki/Fisher" target="_blank" rel="nofollow">http://en.wikipedia.org/wiki/Fisher</a>–Yates_shuffle
 
  Random rng = new Random();
 
  // i is the number of items remaining to be shuffled.
  for (int i = array.length; i > 1; i--) {
 
    // Pick a random element to swap with the i-th element.
    int j = rng.nextInt(i);  // 0 <= j <= i-1 (0-based array)
 
    // Swap array elements.
    String tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}


void shuffle(){
  
  //need to re-set initial values
  resettracking();
  
  shuffleArray(A);
  shuffleArray(B);
  shuffleArray(C);
  /*shuffleArray(D);
  shuffleArray(E);
  shuffleArray(F);
  shuffleArray(G);
  shuffleArray(H);*/
  print("shuffle done");
}


void resettracking()
{
  tracking.set("A", 0); 
  tracking.set("B", 0); 
  tracking.set("C", 0);
  tracking.set("D", 0); 
  tracking.set("E", 0); 
  tracking.set("F", 0); 
  tracking.set("G", 0); 
  tracking.set("H", 0); 
}


/*


"while True:
"  shuffle, a, b, c
"  for i to len(Formulas(rand*3)):
"          play(i)
*/