void setup()
{
  size(1080,720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x,y);
}

void draw()
{
  background(130);
  
  PVector handle = mousePos().normalize().mult(50);
  strokeWeight(10);
  stroke(0, 220);
  line(0, 0, handle.x, handle.y);
  line(0, 0, -handle.x, -handle.y);
  
  PVector blade = mousePos().normalize().mult(400);
  //Outer Glow
  strokeWeight(15);
  stroke(255, 0, 0, 100);
  line(handle.x, handle.y, blade.x, blade.y);
  line(-handle.x, -handle.y, -blade.x, -blade.y);
  
  //Inner Glow
  strokeWeight(5);
  stroke(255, 190);
  line(handle.x, handle.y, blade.x, blade.y);
  line(-handle.x, -handle.y, -blade.x, -blade.y);
  
  println(blade.mag());
}
