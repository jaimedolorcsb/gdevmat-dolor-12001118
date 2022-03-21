public class Walker
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  
  float CONST_MAX_VELOCITY = 13;
  int scale;
  
  void render()
  {
    stroke(0);
    fill(255);
    circle(position.x, position.y, scale);
  }
  
  void updatePosition(PVector direction)
  { 
    velocity.x += acceleration.x * direction.x;
    velocity.y += acceleration.y * direction.y;
    velocity.limit(CONST_MAX_VELOCITY);
    
    position.add(velocity);
  }
  
}
