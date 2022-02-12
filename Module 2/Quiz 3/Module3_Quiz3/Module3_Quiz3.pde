void setup()
{
  size(1280,720,P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); 
  background(255);
}

void draw()
{
  if (frameCount % 300 == 0)
    background(255);
    
  float gaussian = randomGaussian();
  float stdDeviation = 500;
  float mean = 0;
  
  float x = stdDeviation * gaussian + mean;
  float y = random(-height, height);
  
  color col = color(int(random(256)), int(random(256)), int(random(256)));
  fill(col, random(10, 101));
  noStroke();
  
  float range = 75;
  float gaussianCol = randomGaussian();
  float stdDeviationCol = random(-range, range);
  float meanCol = random(-range, range);
  circle(x, y, stdDeviationCol * gaussianCol + meanCol);
  
  //Displays the difference between Normal Distribution and Uniform Distribution
  //Use background(0);
  //renderNormalDistro();
  //renderUniformDistro();
}

void renderUniformDistro()
{
  float range = 500;
  float x = random(-range, range);
  circle(x,-150,30);
}

void renderNormalDistro()
{
  float gaussian = randomGaussian();
  
  float stdDeviation = 100;
  float mean = 0;
  
  float x = stdDeviation * gaussian + mean;
  
  noStroke();
  fill(255,10);
  circle(x,0, 30);
}
