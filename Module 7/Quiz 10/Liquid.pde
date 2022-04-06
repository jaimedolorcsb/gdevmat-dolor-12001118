public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float coeffDrag;
  
  public Liquid(float x, float y, float horizon, float depth, float drag)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    coeffDrag = drag;
  }
  
  public void render()
  {
    fill(28, 120, 186);
    noStroke();
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
   public boolean isCollidingWith(Walker other)
  {
    return other.position.x > x - horizon &&
            other.position.x < x + horizon &&
            other.position.y < y; 
  }
  
  public PVector calcDragForce(Walker walker)
  {
     float speed = walker.velocity.mag();
     float dragMagnitude = coeffDrag * speed * speed;
     
     PVector dragForce = walker.velocity.copy().mult(-1);
     
     dragForce.normalize();
     dragForce.mult(dragMagnitude);
     return dragForce;
  }
}
