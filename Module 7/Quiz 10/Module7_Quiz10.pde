Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker myWalkers[] = new Walker[10];

void setup()
{
  size(1280,720,P3D);
  camera(0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  for (int i = 0; i < myWalkers.length; i++)
  {
    float posX = 10 + (Window.windowWidth / myWalkers.length) * (i - (myWalkers.length / 2)) * 2;
    myWalkers[i] = new Walker();
    myWalkers[i].mass = i + 1;
    myWalkers[i].position = new PVector(posX, Window.top - 50);
    myWalkers[i].col = color((int) random(256), (int) random(256), (int) random(256));
  }
}

void draw()
{
  background(255);
  ocean.render();
  
  for (Walker myWalker : myWalkers)
  {
    myWalker.update();
    myWalker.render();
  
    PVector wind = new PVector(0.1, 0);
    myWalker.applyForce(wind);
  
    PVector gravity = new PVector(0, -0.15 * myWalker.mass);
    myWalker.applyForce(gravity);

    float c = 0.1;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = myWalker.velocity.copy();
    myWalker.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
  
    if (ocean.isCollidingWith(myWalker))
    {
      PVector dragForce = ocean.calcDragForce(myWalker);
      myWalker.applyForce(dragForce);
    }  
  }
  
}
