Walker[] blobs = new Walker[100];

PVector mousePos()
{
  return new PVector(mouseX - Window.windowWidth / 2, -(mouseY - Window.windowHeight / 2)); 
}

void initScene()
{
  for (int i = 0; i < blobs.length; i++)
  {
    blobs[i] = new Walker();
    blobs[i].position = new PVector(random(Window.left - 20, Window.right + 20), random(Window.bottom - 20, Window.top + 20));
    blobs[i].velocity = new PVector(0,0);
    blobs[i].acceleration = new PVector(random(0.5, 0.1), random(0.5, 0.1));
    blobs[i].scale = (int)random(10, 25);
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
  background(80);
  PVector mouse = mousePos();
    
  for (int i = 0; i < blobs.length; i++)
  {
    PVector dir = PVector.sub(mouse, blobs[i].position).normalize();
    blobs[i].updatePosition(dir);
    blobs[i].render();
  }
}
