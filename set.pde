//Global variable should be start with Upper case and Local variable should be start with Lower case
//function which use Global variable should be start with Upper case, else should be start with Lower case
//All the text which shows inside the program must be read from file(without titles).
import processing.net.*;

int GMod, InputMod, StateMod, Click, ServerState;

void settings() {

  fullScreen(P2D);
  /*
  size(1136, 640, P2D); -> for OS X
   size(1136, 640); -> for windows
   unknown error why p2d is not run on windows
   */
  pixelDensity(displayDensity());
}

void setup() {
  reset();
}

void reset() {
  
}