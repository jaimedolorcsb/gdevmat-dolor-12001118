class Walker
{
  
  PVector position = new PVector();
  PVector speed = new PVector(5,5);
  color col;
  
  void render()
  {
    fill(col, 150);
    noStroke();
    
    circle(position.x, position.y, 50);
  }
  
  void randomWalk()
  {
    int dir = int(random(4));
    
    switch (dir)
    {
      case 0:
        position.y += speed.y;
        break;
      case 1:
        position.x += speed.x;
        break;
      case 2:
        position.y -= speed.y;
        break;
      case 3:
        position.x -= speed.x;
        break;
    }
  }
  
  void randomWalkBiased()
  {
    float dir = int(random(100));
    
    if (dir < 25)
    {
      position.y += speed.y;
    } 
    else if (dir < 45)
    {
      position.x += speed.x; 
    }
    else if (dir < 70)
    {
      position.y -= speed.y; 
    } else {
      position.x -= speed.x; 
    }
  }
  
  void moveAndBounce()
  {
    position.x += speed.x;
    position.y += speed.y;
    
    if (position.x > Window.right || position.x < Window.left)
    {
      speed.x *= -1;
      changeCol();
    }
    
    if (position.y > Window.top || position.y < Window.bottom)
    {
      speed.y *= -1; 
      changeCol();
    }
  }
  
  void changeCol()
  {
    col = color(int(random(256)), int(random(256)), int(random(256)));  
  }
}
