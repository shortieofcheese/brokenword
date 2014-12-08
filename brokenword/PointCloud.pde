class PointCloud 
{
  boolean paused = false;
  Particle [] p;
  int length;

  PointCloud (int n) // requires an integer which determines the number of particles
  {
    this.length = n;
    p = new Particle [0];
  }
  void addPatricel (Particle cp)
  {
    if (p.length <= length) p = (Particle[]) append (p, cp); // if the number declared in the pointcloud is greater than the number of particles then add more particles
  }
   
  void updateSimple (float [] [] target)
  {
    for (int i = 0; i < p.length; i++)
    {
      p[i].update (target [i] [0], target [i] [1]);
    }

    paused = false;
  }

  void checkFinishing () // check to see if particles have reached and pauses it if they have
  {
    boolean targetRechead = true;
    for (int i = 0; i < p.length; i++)
    {
      if (!p[i].targetRechead)
      {
        targetRechead = false;
        break;
      }
    }
    
    if (targetRechead) paused = true;
  }

  void draw () //draws the particles and makes them move
  {
    for (int i = 0; i < p.length; i++)
    {
      if (!paused) p[i].move();
      p[i].draw();
    }
    
    checkFinishing();
  }
}

