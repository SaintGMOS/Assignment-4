class Enemy
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  boolean isHit;
  boolean exploded;
  int explosionTimer; 
  
  // Constructor to accept the starting position and the image
  Enemy(PVector startPosition) 
  {
    
    position = startPosition;
    velocity = new PVector(0, 2); // Initial downward velocity
    acceleration = new PVector(0, .1); // Constant downward acceleration
    size = 100;
    isHit = false;
    exploded = false;
    explosionTimer = 0;     // Orginal or starter timer is 0
    
  }

  void move()
  {
    
    // Adjust the horizontal position with a smoother effect
    float mouseXOffset = (mouseX - width / 2) * 0.009;
    position.x += mouseXOffset; // Use += for more controlled movement

    // Apply vertical movement using velocity and acceleration
    velocity.add(acceleration);
    position.y += velocity.y;

    // Constrain enemy within screen bounds
    position.x = constrain(position.x, 0 + size / 2, width - size / 2);
  }

  void display() 
  {
    
   if (!isHit) 
    {
      
      imageMode(CENTER);
      image(pirate, position.x, position.y, size, size); // Display the pirate image
      
    }
  }

  // Placeholder for hit detection 
  boolean checkHit(float mouseX, float mouseY) 
  {
    // Check if the mouse position is within the enemy's bounding circle
    float distanceToMouse = dist(mouseX, mouseY, position.x, position.y);

    // Return true if the distance is less than or equal to the enemy's size radius/area
    if (distanceToMouse <= size / 2) 
    {
      
      isHit = true;
      return true;
      
    }
    return false;
  }
}
