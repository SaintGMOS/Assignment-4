class Enemy
{
  // Attributes of the enemy object
  PVector position; // Position vector representing the current location of the enemy
  PVector velocity; // Velocity vector controlling the speed and direction of movement
  PVector acceleration; // Acceleration vector for dynamic movement
  float size; // Size of the enemy object, used for display and hit detection
  boolean isHit; // Flag to track if the enemy has been hit
  boolean exploded; // Flag to track if the enemy has exploded (future implementation)
  int explosionTimer; // Timer to manage explosion duration (future implementation)
  
  // Constructor to accept the starting position and the image
  Enemy(PVector startPosition) 
  {
    
    position = startPosition; // Set the starting position
    velocity = new PVector(0, 2); // Enemy starts moving downwards with an initial speed
    acceleration = new PVector(0, .1); // Constant downward acceleration
    size = 100; // Default size of the enemy
    isHit = false; // Enemy is not hit at creation
    exploded = false; // Explosion state is not active
    explosionTimer = 0;  // Timer is initialized to 0
    
  }

  // Function to control the movement of the enemy
  void move()
  {
    
    // Create a smoother horizontal movement effect based on mouse position
    float mouseXOffset = (mouseX - width / 2) * 0.009;
    position.x += mouseXOffset; // Use += for more controlled movement

    // Apply vertical movement using velocity and acceleration
    velocity.add(acceleration);
    position.y += velocity.y;

    // Constrain enemy within screen bounds
    position.x = constrain(position.x, 0 + size / 2, width - size / 2); 
    
  }

  // Function to display the enemy
  void display() 
  {
    
   if (!isHit)  // Only display the enemy if it hasn't been hit
    {
      
      imageMode(CENTER); // Center the image at the position
      image(pirate, position.x, position.y, size, size); // Display the pirate image
      
    }
    
  }

  // Placeholder for hit detection 
  boolean checkHit(float mouseX, float mouseY) 
  {
    
    // Calculate the distance between the mouse and the enemy's position
    float distanceToMouse = dist(mouseX, mouseY, position.x, position.y);

    // Check if the mouse click is within the enemy's are
    if (distanceToMouse <= size / 2) 
    {
      
      isHit = true;
      return true;
      
    }
    return false;
    
  } 
}
