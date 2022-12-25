import processing.sound.*;

import java.io.BufferedWriter;
import java.io.FileWriter;

//booleans for screen manipulation
boolean homeB, firstGameB, highscoresB, gameOverB, settingsB;
Home home;
FirstGame firstGame;
Highscores highscores;
GameOver gameOver;
Settings settings;

//images
PImage basket;
PImage background1;
PImage heart;
PImage heartEmpty;
PImage leftArrow;
PImage logo;
PImage[] objectImages;

//colors
color yellow = color(255, 255, 102);
color blue = color(0, 153, 204);
color darkblue = color(0, 96, 128);
color lightblue = color(153, 230, 255);
color green = color(64, 191, 64);
color darkgreen = color(38, 115, 38);
color lightgreen = color(159, 223, 159);
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color orange = color(255, 153, 51);
color red = color(226, 0, 0);

//font
PFont f;

//sound
SoundFile song1;
SoundFile error;
SoundFile click;
SoundFile pop;
boolean musicOn;
int volume;

//other variables
int score; //player game score
int numFall; //number of falling object

int size;
int difficulty;
boolean first=true;//used to play music only once

void setup() {
  size=1;
  difficulty=1;
  size(700,600);
  
  score=0;
  numFall=14;

//.............................IMAGES............................

  objectImages = new PImage[numFall];

  //load and resize all images
  background1 = loadImage("background1.jpg");
  heart = loadImage("heart.png");
  heartEmpty = loadImage("heartEmpty.png");
  leftArrow = loadImage("left-arrow.png");
  logo = loadImage("Capture-removebg-preview.png");

  heart.resize(30, 0);
  heartEmpty.resize(30, 0);
  leftArrow.resize(35, 0);

//.............................FONT............................
  f = loadFont("ProcessingSansPro-Semibold-48.vlw");
  textFont(f);
  
  //initialize screen booleans
  homeB = true;
  firstGameB = false;
  highscoresB = false;
  gameOverB = false;
  settingsB = false;

//.............................SOUND............................
  //load songs
  song1 = new SoundFile(this, "bensound-jazzyfrenchy2.wav");
  error = new SoundFile(this, "mixkit-electric-pop-2365.wav");
  click = new SoundFile(this, "mixkit-plastic-bubble-click-1124.wav");
  pop = new SoundFile(this, "mixkit-long-pop-2358.wav");
  //set volume
  click.amp(0.3);
  pop.amp(0.5);
  
  musicOn=true;
  volume=100;
  
  init();

}

void draw() {
  if ( homeB ) {
    home.myDraw();
  }
  if ( firstGameB ) {
    firstGame.myDraw();
  }
  if ( highscoresB ) {
    highscores.myDraw();
  }
  if ( gameOverB ) {
    gameOver.myDraw();
  }
  if ( settingsB ) {
    settings.myDraw();
  }

}


void mousePressed() {
  if (homeB) home.myMousePressed();
  else if (firstGameB) firstGame.myMousePressed();
  else if (highscoresB) highscores.myMousePressed();
  else if (gameOverB) gameOver.myMousePressed();
  else if (settingsB) settings.myMousePressed();
}

//Check if mouse hovers over rectangle
boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//appends text to file
void appendTextToFile(String filename, String text) {
  File f = new File(dataPath(filename));
  if (!f.exists()) {
    try {
    f.createNewFile();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}


void init(){
  
  background1.resize(width, height);
  basket = loadImage("basket.png");
  basket.resize(width/5, 0);
  
  for (int i=0; i<numFall; ++i) {
    objectImages[i] = loadImage(i+".png");
    objectImages[i].resize(0, width/10);
  }
  
  logo = loadImage("Capture-removebg-preview.png");
//.............................SCREENS............................
  //initialize screens
  home = new Home();
  firstGame = new FirstGame();
  highscores = new Highscores();
  gameOver = new GameOver();
  settings = new Settings();


  
  
}
