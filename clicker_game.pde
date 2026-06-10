import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
int shadowText, rectButton;

float x, y, d;  
float vx, vy;
int score, lives, highscore;
float sliderY;


void setup() {
  size(800, 800);
  mode = INTRO;
  x = width/2;
  y = height/2;
  score = 0;
  lives = 3;
  d = 100;
  sliderY = 600;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  vx = random(-5, 5);
  vy = random(-5, 5);
  reset();
  highscore = 0;
  
}
void game() {
  background(0, 255,0);
  stroke(0);
  fill(#DA90FF);
  circle(100, 100, 100);
  fill(0);
  text("Score: " + score, width/2, 50);
  text("Lives: " + lives, width/2, 100);
  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse(x, y, 100, 100);
  x = x + vx;
  y = y + vy;
  if (x < 50 || x > width-50) {
 vx = vx * -1; 
  }
  if (y < 50 || y > height-50) {
    vy = vy * -1;
  }
}

void intro() {
  background(255);
  rect(300, 500, 200, 100);
  strokeWeight(1);
  fill(0);
  textSize(72);
  text("CLICKER GAME", 400, 400);
  if (mouseX > 300 && mouseX < 500 && mouseY > 550 && mouseY < 400);
  fill(200);
  
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
}
}
void gameoverClicks() {
  reset();
  mode = INTRO;
  if (clickedOnRect(650, 700, 200, 100)) {
    exit();
  }
}
void pause() {
  background(0);
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = GAME;
  }
}

void gameClicks() {
  if (dist(mouseX, mouseY, x, y) < 50) {
    score = score + 1;
  } else if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = PAUSE;
  } else {
    lives = lives -1;
    if (lives == 0) mode = GAMEOVER;
}
}
void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
} else if (mode == PAUSE) {
  pausescreen();
} else if (mode == GAMEOVER) {
  gameover();
} else {
  println( + mode);
}
}

void pausescreen() {
  fill(0);
  text("PAUSED", 400, 400);
}

void gameover() {
  background(255, 0, 0);
  text("GAME OVER", 400, 400);
  if (score > highscore) {
    highscore = score;
}
shadowText("High Score: " + highscore, 400, 500, 80);
rectButton("Quit", 650, 700, 200, 100);
}
//if (x < 50

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    //gameoverClicks();
  }
}
boolean clickedOnRect(float x, float y, float w, float h) {
  return mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2;
}
    
    void reset() {
      x = width/2;
  y = height/2;
  vx = random(-5, 5);
  vy = random(-5, 5);
  score = 0;
  lives = 3;
  d = 100;
  sliderY = 600;
    }
