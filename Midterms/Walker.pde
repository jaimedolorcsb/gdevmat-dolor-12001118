public class Walker
{
  PVector position = new PVector();
  float speed = 10;
  color col;
  float st = random(15, 48);
  
  void render()
  {
    noStroke();
    fill(col);
    circle(position.x, position.y, 50); 
  }
  
  void renderBlob()
  {
    float s = map(noise(st), 0, 1, 15, 48);
    noStroke();
    fill(col);
    circle(position.x, position.y, s);
  }
  
  void changePos()
  {
    position.x = random(Window.left, Window.right);
    position.y = random(Window.bottom, Window.top);
  }
  
  void changePosRelative(PVector otherPos)
  {
    float gaussianX = randomGaussian();
    float gaussianY = randomGaussian();
    
    float xStdDev = 0;
    float xMean = 0;
    
    float yStdDev = 0;
    float yMean = 0;
    
    if (otherPos.x < 0 && otherPos.y < 0)
    {
      xStdDev = 700;
      xMean = Window.left + 200;
      yStdDev = 800;
      yMean = Window.bottom + 300;
    } 
    else if (otherPos.x > 0 && otherPos.y < 0)
    {
      xStdDev = 700;
      xMean = Window.right - 200;
      yStdDev = 800;
      yMean = Window.left + 200;
    } 
    else if (otherPos.x < 0 && otherPos.y > 0)
    {
      xStdDev = 700;
      xMean = Window.right - 200;
      yStdDev = 800;
      yMean = Window.bottom + 200; 
    } 
    else if (otherPos.x > 0 && otherPos.y > 0)
    {
      xStdDev = 700;
      xMean = Window.left + 200;
      yStdDev = 800;
      yMean = Window.bottom - 200; 
    }
  
    position.x = gaussianX * xStdDev + xMean; 
    position.y = gaussianY * yStdDev + yMean;
  }
}
