class Particle 
{
  float cx, cy; //current position
  float tx, ty; //target position
  float speed = 0; 
  boolean targetRechead = false;

  Particle (float cx, float cy, float tx, float ty) // takes the fed arguments of and sets them equal to the variables
  {
    this.cx = cx;
    this.cy = cy;
    this.tx = tx;
    this.ty = ty;
  }

  void update (float tx, float ty) // redefines the target locations
  {
    targetRechead = false;
    speed = 0;
    this.tx = tx; //updates the target from the last target
    this.ty = ty; //updates the target based on last target
  }

  void move () //move logic - what to do when it is not reached
  {
    if (!targetRechead)
    {
      float amt = sin (speed); //amt is between 0 and 1
      cx = lerp (cx, tx, amt); // lerp from current to target at a certain speed
      cy = lerp (cy, ty, amt);
      speed += 0.001;
      
     if ( (int) cx ==  (int) tx && (int) cy == (int) ty) targetRechead = true; //if currents = targets then reached = true
     if (speed >= 0.13) //this curbs the lerp speed and makes the particles where they need to be
     {
       targetRechead = true;
       cx = tx;
       cy = ty;
     }
    }
  }

  void draw ()
  {
   point (cx, cy);
   //ellipse (cx,cy,1,1);
  }
}


