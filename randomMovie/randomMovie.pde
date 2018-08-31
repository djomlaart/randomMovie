import processing.video.*;
import deadpixel.keystone.*;
import java.util.Collections;
import java.util.Random;



//ArrayList<Movie>   moviesPlaying = new ArrayList<Movie>();
String naslov= "/Users/mladenlazarevic/Desktop/wetransfer/naslov_koji_izmedju_filmova.mov";
//String naslov= "/Users/mladenlazarevic/Desktop/wetransfer/a01.mov";

String[] A = {"/Users/mladenlazarevic/Desktop/wetransfer/a01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a06.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a07.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a08.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a09.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/a10.mov", "/Users/mladenlazarevic/Desktop/wetransfer/a11.mov", "nula"};


String[] D = {"/Users/mladenlazarevic/Desktop/wetransfer/d01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d06.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d07.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d08.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d09.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/d10.mov", "nula"};


String[] E = {"/Users/mladenlazarevic/Desktop/wetransfer/e01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e06.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/e07.mov", 
"/Users/mladenlazarevic/Desktop/wetransfer/e08.mov", "nula"};


String[] F = {"/Users/mladenlazarevic/Desktop/wetransfer/f01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f06.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f07.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f08.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/f09.mov", "nula"};

String[] G = {"/Users/mladenlazarevic/Desktop/wetransfer/g01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/g02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/g03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/g04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/g05.mov", "nula"};


String[] H = {"/Users/mladenlazarevic/Desktop/wetransfer/h01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h06.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h07.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h08.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h09.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h10.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h11.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h12.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h13.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h14.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h15.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/h16.mov",  "nula"};


String[] J = {"/Users/mladenlazarevic/Desktop/wetransfer/j01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/j02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/j03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/j04.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/j05.mov", 
"/Users/mladenlazarevic/Desktop/wetransfer/b01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/b02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/b03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/b05.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/b06.mov", 
"/Users/mladenlazarevic/Desktop/wetransfer/c01.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/c02.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/c03.mov",
"/Users/mladenlazarevic/Desktop/wetransfer/c04.mov","nula"};



/*String[][][] Formulas= {{A, A, A}, {C, C, B}, {B, B, A}};
String[][] sFormulas= {{"A", "A", "A"}, {"C", "C", "B"}, {"B", "B", "A"}};
*/



String[][][] Formulas= {{A,J,H,H,E,D,F,G},
{A,F,H,H,H,J,D},
{F,J,D,A,H,G},
{A,J,E,D,H,F,G},
{G,H,H,F,J,E},
{A,E,H,H,H,H,J,G},
{H,E,J,G}};


String[][] sFormulas= {{"A","J","H","H","E","D","F","G"}, {"A","F","H","H","H","J","D"},
{"F","J","D","A","H","G"},
{"A","J","E","D","H","F","G"},
{"G","H","H","F","J","E"},
{"A","E","H","H","H","H","J","G"},
{"H","E","J","G"}};



ArrayList<Movie> playlist = new ArrayList<Movie>();  
Movie currentMovie;
int index = 0; 
int fIndex = 0;
float movieEndDuration = 0.042;//a 'magic number' helpful to find out when a movie finishes playing


IntDict tracking;




void setup() {
  fullScreen(P2D);
  //size(2880,1800);
  frameRate(25);

  
  tracking = new IntDict();
  
  tracking.set("A", 0); 

  tracking.set("D", 0); 
  tracking.set("E", 0); 
  tracking.set("F", 0); 
  tracking.set("G", 0); 
  tracking.set("H", 0);
  tracking.set("J", 0);

  
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
    //image(playlist.get(index), 0,0, 1440, 900);
    image(playlist.get(index), 0,0, 1280, 720);

  }
}




void movieEvent(Movie m) {
  if (m.available()){
      m.read();
      redraw=true;

  }

  
  // here i'm just cheking if it's the end of the movie
  if( m.time() + movieEndDuration>= m.duration() ) {
   
   // print("movie_end");
    // if we've havent reached end of the formula/list, we just play next video from the formula/list
    if (index<playlist.size()-1){
    //  print("next");
      playlist.get(index+1).play();
      index+=1;

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
  shuffleArray(D);
  shuffleArray(E);
  shuffleArray(F);
  shuffleArray(G);
  shuffleArray(H);
  shuffleArray(J);

  print("shuffle done");
}


void resettracking()
{
  tracking.set("A", 0); 

  tracking.set("D", 0); 
  tracking.set("E", 0); 
  tracking.set("F", 0); 
  tracking.set("G", 0); 
  tracking.set("H", 0); 
  tracking.set("J", 0); 

}


/*


"while True:
"  shuffle, a, b, c
"  for i to len(Formulas(rand*3)):
"          play(i)
*/