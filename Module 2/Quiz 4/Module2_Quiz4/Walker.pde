class Walker
{
  float x;
  float y;
  float tx;
  float ty = 1000;
  float at = 0;
  float rt = 255;
  float gt = random(256);
  float bt = random(256);
  
  void render()
  {
    float a = map(noise(at), 0, 1, 5, 150);
    float r = map(noise(rt), 0, 1, 0, 255);
    float g = map(noise(gt), 0, 1, 0, 255);
    float b = map(noise(bt), 0, 1, 0, 255);
    
    fill(color(r,g,b), 255);
    noStroke();
   
   println(r + " " + g + " " + b);
    
    circle(x, y, a);
    at += 0.1f;
    rt += 0.1f;
    gt += 0.1f;
    bt += 0.1f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -(width / 2), width / 2);
    y = map(noise(ty), 0, 1, -(height / 2), height / 2);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}
