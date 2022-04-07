public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float massToScale = 10;
  public float mass = 1;
  public float gravConstant = 1;
  
  public color col;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0); 
  }
  
  public void render()
  {
    fill(col);
    noStroke();
    circle(position.x, position.y, mass * massToScale);
  }
  
  public void checkEdges()
  {
    if (position.x > Window.right)
    {
      position.x = Window.right;
      velocity.x *= -1;
    } 
    
    if (position.x < Window.left)
    {
      position.x = Window.left;
      velocity.x *= -1;
    }
    
    if (position.y > Window.top)
    {
      position.y = Window.top;
      velocity.y *= -1; 
    } 
    
    if (position.y <= Window.bottom)
    {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
  
  public PVector calcGravAttraction(Walker other)
  {
    PVector force = PVector.sub(position, other.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (gravConstant * mass * other.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
