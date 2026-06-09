int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;


float x, y, d;  
float vx, vy;

void setup() {
  size(800, 800);
  mode = INTRO;
  x = width/2;
  y = height/2;
  d = 100;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
}
void game() {
  background(0, 255,0);
  fill(255);
  stroke(0);
  strokeWeight(5);
  circle(x, y, d);
  x = x + vx;
  y = y + vy;
}

void intro() {
  background(255);
  rect(300, 500, 200, 100);
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
}
}
void gameoverClicks() {
  mode = INTRO;
}

void pause() {
  background(0);
}

void pauseClicks() {
}

void gameClicks() {
  if (true) {
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
}

void gameover() {
  background(255, 0, 0);
  text("GAME OVER", 400, 400);
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
