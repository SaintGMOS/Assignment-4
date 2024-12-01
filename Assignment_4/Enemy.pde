class Enemy {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  boolean isHit;
 
   Enemy(PVector startPosition)
  {
    position = startPosition;
    velocity = new PVector(0, 2); // Initial velocity
    acceleration = new PVector(0, 0.05); // Constant downward acceleration
    size = 30;
    isHit = false; // Checks if its hit
  }

  
   void move() 
   {
    // Adjust horizontal position based on mouse movement
    float mouseXOffset = mouseX - width / 2;
    float mouseYOffset = mouseY - height / 2;
    
    // Create the illusion of horizontal camera movement
    position.x -= mouseXOffset * 0.01; 
     
    // Apply vertical adjustment for camera illusion
    position.y += velocity.y - mouseYOffset * 0.01;

     // Apply acceleration to velocity
    velocity.add(acceleration);

    // Constrain enemy within screen bounds
    position.x = constrain(position.x, 0 + size / 2, width - size / 2);

   }
    void display()
  {
    if (!isHit)
    {
      fill(255, 0, 0);
      ellipse(position.x, position.y, size, size);
    }
  }
  
  
  
}
