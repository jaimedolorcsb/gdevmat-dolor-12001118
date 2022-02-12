class Walker
{
  
  float x;
  float y;
  color col;
  
  void render()
  {
    changeCol();
    fill(col, int(random(50,101)));
    noStroke();
    
    circle(x,y,20);
  }
  
  void randomWalk()
  {
    int dir = int(random(4));
    int distance = 5;
    
    switch (dir)
    {
      case 0:
        y += distance;
        break;
      case 1:
        x += distance;
        break;
      case 2:
        y -= distance;
        break;
      case 3:
        x -= distance;
        break;
    }
  }
  
  void randomWalkBiased()
  {
    float dir = int(random(100));
    int distance = 5;
    
    if (dir < 25)
    {
      y += distance;
    } 
    else if (dir < 45)
    {
      x += distance; 
    }
    else if (dir < 70)
    {
      y -= distance; 
    } else {
      x -= distance; 
    }
  }
  
  void changeCol()
  {
    col = color(int(random(256)), int(random(256)), int(random(256)));  
  }
}
