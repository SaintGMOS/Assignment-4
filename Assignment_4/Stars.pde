class Stars
{
  // As you may tell there is still some inspiration from my previous code. 
  // I've tried to tweak and change it as much as I can to make it somewhat different.
  float x, y;  // Positions of the Stars
  
   Stars(float xPosition, float yPosition)
    {
    x = xPosition; // Set X position
    y = yPosition; // Set Y position
  }
  
 
  void display()
  {
   
    float adjustedX = x - mouseX * 0.05; 
    float adjustedY = y - mouseY * 0.05;
    
    fill(255); // White color for stars
    ellipse(adjustedX, adjustedY, 2, 2); // Draw star
  
}

}

class Starz
{
  ArrayList<Stars> starCapacity;

Starz() 
{
    starCapacity = new ArrayList<Stars>();
    // Initialize the stars with random positions
    for (int i = 0; i < 120; i++) 
    {
      float starX = random(-width, 2 * width); // Allow positions off-screen
      float starY = random(-height, 2 * height);
      starCapacity.add(new Stars(starX, starY)); 
    }
  }
  
    void display()
  {
   
    
    
  }


}
