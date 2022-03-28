Walker[] walkers = new Walker[8];

void initScene()
{
   for (int i = 0; i < walkers.length; i++)
  {
    float posY = 10 + (Window.windowHeight / walkers.length) * (i - (walkers.length / 2)) * 1;
    walkers[i] = new Walker();
    walkers[i].mass = i + 1;
    walkers[i].position = new PVector(Window.left + 100, posY);
    walkers[i].col = color(random(0, 256), random(0, 256), random(0,256));
  }
}

void setup()
{
  size(1280, 720, P3D);
  camera(0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  initScene();
}

void draw()
{
  background(255);
  line(0, Window.top, 0, Window.bottom);
  
  for (Walker w : walkers)
  {
    
    //Friction = -1 * mew * normalForce * unitVector
    float mew = w.position.x > 0 ? 0.4 : 0.01;
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    //Acceleration
    PVector acceleration = new PVector(0.2, 0);
    
    w.render();
    w.applyForce(friction);
    w.applyForce(acceleration);
    
    //Uncomment for Bonus implementation
    //w.applyForce(w.acceleration.div(w.mass));
    
    w.update();
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1; 
    }
     
    if (w.position.x >= Window.right)
    {
      w.position.y = Window.right;
      w.velocity.x *= -1;    
    }
  }
  
  if (mousePressed)
    initScene();
}
