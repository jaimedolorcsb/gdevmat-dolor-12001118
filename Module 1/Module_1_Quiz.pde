float time = 0.0f;
float freq = 0.2f;
float amp = 20.0f;

void setup()
{
  size(1280,720,P3D); 
}

void draw()
{
  background(255/2);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  time += 0.1f;
  
  drawCartesianPlane();
  
  color yellow = color(255,255,0);
  color purple = color(138,43,226);
  color blue = color(0,0,255);
  
  drawParabola(1, -15, -3, yellow);
  drawLinear(-5, 30, purple);
  drawSinWave(freq, amp, blue);
  
  
  /*
    Press A key to decrease frequency
    Press S key to decrease amplitude
    Press Z key to increase frequency
    Press X key to increase amplitude
  */
  if (keyPressed)
  {
    switch (key)
    {
      case 'z':
        if (freq - 0.01f <= 0) break;
        freq -= 0.01f;
        break;
      case 'x':
        if (amp - 0.1f <= 0) break;
        amp -= 0.1f;
        break;
      case 'a':
        freq += 0.01f;
        break;
      case 's':
        amp += 0.1f;
        break;
    }
  }
  
}

void drawCartesianPlane()
{
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  strokeWeight(2);
  
  line(1280, 0, -1280, 0);
  line(0, 720, 0, -720);
  
  
  int gap = 20;
  int offset = 10;
  
  for (int x = -width; x <= width; x+=gap)
  {
    line(x, -offset, x, offset);
  }
  
  for (int y = -width; y <= width; y+=gap)
  {
    line(-offset, y, offset, y);
  }
}

void drawParabola(int a, int b, int c, color col)
{
  fill(col);
  stroke(col);
  noStroke();
  
  for (float x = -300; x <= 300; x+= 0.1f)
  {
    circle(x, (float)(Math.pow(x,2) * a) + (b * x) + c, 5.0f);  
  }
}

void drawLinear(int m, int b, color col)
{
  fill(col);
  noStroke();
  
  for (float x = -200; x <= 200; x+=0.5f)
  {
    circle(x, (m*x) + b, 5.0f); 
  }
}

void drawSinWave(float freq, float amp, color col)
{
  fill(col);
  stroke(col);
  noStroke();
  
  for (float x = -300; x <= 300; x+= 0.5f)
  {
    circle(x,(float)(Math.sin((x * freq) + time) * amp),6.0f);  
  }
}
