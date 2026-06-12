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
final int OPTIONS = 4;
int shadowText, rectButton;

float x, y, d;  
float vx, vy;
int score, lives, highscore;
float sliderY;
AudioPlayer intro, theme, click, gameover, fail;
Minim minim;
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
minim = new Minim(this);
theme = minim.loadFile("song.mp3");
intro = minim.loadFile("intro.mp3");
click = minim.loadFile("click.mp3");
gameover = minim.loadFile("final.mp3");
fail = minim.loadFile("fail.mp3");

}
void game() {
  background(0, 255,0);
  intro.pause();
  theme.play();
  gameover.pause();
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
  background(#43E5C6);
  intro.play();
  theme.pause();
  rectButton("Begin", 200, 600, 250, 100);
  rectButton("options", 600, 600, 250, 100);
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
  if (dist(mouseX, mouseY, x, y) < d/2) {
    score = score + 1;
    click.play();
    vx = vx * 1.2;
    vy = vy * 1.2;
  } else if (dist(mouseX, mouseY, 100, 100) < 50) {
    mode = PAUSE;
  } else {
    background(255, 0, 0);
    lives = lives -1;
    click.pause();
    fail.play();
    fail.rewind();
    if (lives == 0) mode = GAMEOVER;
}
}

void options() {
}

void optionsClicks() {
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
} else if (mode == OPTIONS) {
  options();
} else {
  println("Mode rror: Mode is" + mode);
}
}

void pausescreen() {
  theme.pause();
  intro.pause();
  click.pause();
  gameover.play();
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
    gameoverClicks();
  } else if (mode == OPTIONS) {
    optionsClicks();
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
  d = 50;
  sliderY = 600;
    }
    
void shadowText(String text, float x, float y, int size) {
  textSize(size);
  fill(0);
  text(text, x-5, y+5);
  fill(255);
  text(text, x, y);
}
    
void rectButton(String text, float x, float y, float w, float h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    strokeWeight(10);
    stroke(255, 0, 0);
    fill(255);
  } else {
    strokeWeight(2);
    stroke(0);
    fill(255);
  }
  textSize(60);
  rect(x, y, w, h);
  fill(0);
  text(text, x, y);
}

void rectButton(PImage pic, float x, float y, float w, float h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    strokeWeight(10);
    stroke(255, 0, 0);
    fill(255);
  } else {
    strokeWeight(2);
    stroke(0);
    fill(255);
  }
}
