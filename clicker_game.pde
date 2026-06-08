int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
 int GAMEOVER = 3;

float x, y, d;  

void setup() {
  size(800, 800);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
}

void game() {
  background(0, 255,0);
}

void intro() {
  background(255);
  rect(300, 500, 200, 100);
}

void introClicks() {
  if (mouseX > 300 && mouseX < 500 && mouseY > 500 && mouseY < 600) {
    mode = GAME;
}
void gameover() {
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
  println("Error: Mode = " + mode);
}
}

if (x < 50

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
    
}
