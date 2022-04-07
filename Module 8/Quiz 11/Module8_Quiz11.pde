Walker walkers[] = new Walker[10];

void setup()
{
  size(1280,720,P3D);
  camera(0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = random(1, 15);
    walkers[i].position = new PVector(random(Window.left + 50, Window.right - 50), random(Window.bottom + 50, Window.top - 50));
    walkers[i].col = color(random(256), random(256), random(256), random(150, 250)); 
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < walkers.length; i++)
  {  
    for (int j = 0; j < walkers.length; j++)
    {
      if (walkers[i] != walkers[j])
        walkers[i].applyForce(walkers[j].calcGravAttraction(walkers[i]));
    }
    
    walkers[i].render();
    walkers[i].update();
  }
}
