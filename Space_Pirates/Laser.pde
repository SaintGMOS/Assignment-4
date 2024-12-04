class Laser
{
  float x; // X-coordinate of start
  float y; // Y-coordinate of start
  float speed = 150; // Speed of the laser movement
  float dx; // Direction vector X-component
  float dy; // Direction vector Y-component
  int laserColor; // Color of the laser


  // Constructor to initialize the Laser object
  Laser(float startX, float startY, float targetX, float targetY, int Color)
  {
    
    x = startX;
    y = startY;
    laserColor = Color;
    
    // Calculate the direction vector from the starting point to the target point
    // atan2 is used to calc the angle between the x-axis and the line connecting two points I'm pretty sure.....
    // https://processing.org/reference/atan2_.html
    float angle = atan2(targetY - startY, targetX - startX);
    dx = cos(angle) * speed;
    dy = sin(angle) * speed;
    
  }

   // Method to update the laser's position based on its speed and direction
  void update()
  {
    // Update the position 
    x += dx;
    y += dy;
    
  }

  // Display the laser as an ellipse on the screen
  void display()
  {
    
    fill(laserColor);
    noStroke();
    ellipse(x, y, random(5,20), random(5,20)); 
    
  }

  // Check if the laser has gone off the screen
  boolean isOffScreen() 
  {
    
    return y < 0 || x < 0 || x > width || y > height; // Check if the laser is off screen
    
  }
}
