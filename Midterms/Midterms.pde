Walker blackHole = new Walker();
Walker[] blobs = new Walker[(int)random(100, 201)];
float timeElapsed = 0;

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

void initScene()
{
  blackHole.changePos();
  blackHole.col = color(255,255,255,255);
    
  for (int i = 0; i < blobs.length; i++)
  {
    blobs[i] = new Walker();
    blobs[i].changePosRelative(blackHole.position);
    blobs[i].col = color(random(256), random(256), random(256), random(120, 220));
  }
}

void setup()
{
  size(1080,720, P3D);
  camera(0,0,Window.eyeZ,0,0,0,0,-1,0);
  
  initScene();
}

void draw()
{
  background(0);
  if (timeElapsed % 100 == 0)
    initScene();
  
  //Uncomment next line for stationary black hole, otherwise it moves with mouse pointer
  blackHole.position = mousePos();
  
  for (int i = 0; i < blobs.length; i++)
  {
    PVector dir = PVector.sub(blackHole.position, blobs[i].position).normalize();
    blobs[i].position.add(PVector.mult(dir, blobs[i].speed));
    blobs[i].renderBlob();
  }
  blackHole.render();
  
  timeElapsed += 0.5;
}
