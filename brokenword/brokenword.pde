PointCloud pc;
PImage  testImg;
PImage  nycImg;
boolean showImage = false; 
boolean doPause = false;
String filename = "brokenword.jpg";


String typed = ""; //words that you are typing
String words = ""; //words that show up
PFont f;
PGraphics pg;
color c = 255;

void setup ()
{
  size (600, 200, P3D); //P3D
  testImg = loadImage ("brokenword.jpg");
  //nycImg = loadImage ("nyc.jpg");
  f = createFont("AktivGrotesk-Regular-60", 60, true);
  pg = createGraphics (600, 200);


  pc = new PointCloud (6000);  //makes a new cloud of points with (x) amount of points within it
  float cx, cy; // current X value and current y value
  while (pc.p.length <= pc.length)
  {
    float [] [] target = (float[] []) findTargets (1, testImg);
    cx = random (width); //gives all the particles a random x
    cy = random (height); //gives all the particles a random y
    pc.addPatricel (new Particle(cx, cy, target[0][0], target[0][1]));
  }
}

void draw ()
{ 
  background (255);
  pc.draw();

  pg.beginDraw();
  pg.background (255);
  pg.textFont(f);
  pg.fill (0);
  pg.rect (0, 0, 600, 1);
  pg.rect (0, 199, 600, 1);
  pg.rect (0, 0, 1, 200);
  pg.rect (599, 0, 1, 200);
  pg.textAlign (CENTER);
  pg.text(typed, width/2, 125);

  //pg.text(words, width/2, 125);


  if (pc.paused) //once the particles all reach they pause
  {
    updatePointCloud (testImg); //tells the points what to do after they have reached/paused
  }
  if (showImage) image (testImg, 10, 10, testImg.width/4, testImg.height/4); //shows a thumbnail preview of the image
}

void updatePointCloud (PImage img) //takes image and uses it to redraw the image based on targets
{
  float [] [] target = (float[] []) findTargets (pc.p.length, img); //tells the points what to do after they are paused
  pc.updateSimple (target); //update position of particles and unpause
}

void keyPressed ()
{
  if (key == '\n' ) {
    words = typed;
    pg.save ("/data/words.jpg");
    pg.endDraw();
    testImg = loadImage("words.jpg");
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
  if (keyCode == '1') {
    doPause = !doPause;
    if (doPause) noLoop(); //stops the draw loop
    else loop(); //starts the draw loop again
  }
  if (keyCode == '2') showImage = !showImage; // switches the bool to show the image preview
  if (keyCode == '3') {
    testImg = loadImage ("NYC.jpg");
  }
}

