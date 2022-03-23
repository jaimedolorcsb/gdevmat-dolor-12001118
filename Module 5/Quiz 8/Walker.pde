public class Walker
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float mass = 1;
  float CONST_MAX_VELOCITY = 10.0;
  
  float masstoScaleRatio = 15.0;
  color col;
  
  public Walker()
  {
    
  }
  
  void render()
  {
    stroke(0);
    fill(col);
    circle(position.x, position.y, mass * masstoScaleRatio);
  }
  
  public void applyForce(PVector force)
  {
    //acceleration = force / mass; 
    //This is how it should be in the real world, in screen pixels it is different
    
    PVector calculatedAcceleration = PVector.div(force, mass); 
    acceleration.add(calculatedAcceleration); //Force Accumulation
  }
  
  void update()
  { 
    velocity.add(acceleration); //Velocity Accumulation
    velocity.limit(CONST_MAX_VELOCITY);
    position.add(velocity);
    acceleration.mult(0); // Resets the acceleration every frame
  }
  
}
