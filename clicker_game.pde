int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
 int GAMEOVER = 3;


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
}
void gameover() {
}

void gameoverClicks() {
}

void pause() {
  background(0);
}

void gameClicks() {
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
} else if (mode == PAUSE) {
  pause();
} else if (mode == GAMEOVER) {
  gameover();
} else {
  println("Error: Mode = " + mode);
}
}

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
