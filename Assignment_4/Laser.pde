class Laser
{
  float x; // X-coordinate of start
  float y; // Y-coordinate of start
  float speed = 150; // Speed of the laser movement
  float dx; // Direction vector X-component
  float dy; // Direction vector Y-component
  int laserColor; // Color of the laser


  Laser(float startX, float startY, float targetX, float targetY, int Color)
  {
    
    x = startX;
    y = startY;
    laserColor = Color;
    
    // Calculate the direction vector from the origin to the target
    // https://processing.org/reference/atan2_.html
    float angle = atan2(targetY - startY, targetX - startX);
    dx = cos(angle) * speed;
    dy = sin(angle) * speed;
    
  }

  void update()
  {
    // Update the position 
    x += dx;
    y += dy;
  }

  void display()
  {
    fill(laserColor);
    noStroke();
    ellipse(x, y, random(5,20), random(5,20)); 
  }


  boolean isOffScreen() 
  {
    
    return y < 0 || x < 0 || x > width || y > height; // Check if the laser is off screen
    
  }
  
  
}
