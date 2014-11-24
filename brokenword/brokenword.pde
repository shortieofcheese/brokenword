String typed = ""; //words that you are typing
String words = ""; //words that show up
PFont f;
PGraphics pg;

void setup () {
  size (600, 200);
  f = createFont("AktivGrotesk-Regular-60", 60, true);
  pg = createGraphics (600, 200);
}

void draw () {
  pg.beginDraw();
  pg.background (255);
  pg.textFont(f);
  pg.fill (0);
  pg.textAlign (CENTER);
  pg.text(typed, width/2, 400);
  pg.text(words, width/2, 125);
  pg.endDraw();
  imageMode(CENTER);
  image(pg, width/2, height/2);
}

void keyPressed () {
  if (key == '\n' ) {
    words = typed;
    typed = "";
  } else {
    typed = typed + key;
  }
  if (keyCode == BACKSPACE) {
    if (typed.length() > 1) {
      typed = typed.substring(0, typed.length()-2);
    }
  } else { 
    typed = typed;
  }
}

