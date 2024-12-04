class Stars
{
  /*
  
   As you may tell there is still some inspiration from my previous code. 
   I've tried to tweak and change it as much as I can to make it somewhat different.
   What I've changed:
  - I changed some of the names of the variables as well as classes.
  -  In the Class Stars I've added new variables such ass adjustedX and Y which moves the location of the stars dpending on where the mous eis on the program.
  - The starOpacity for the random value is now 2 set numbers istead of 1.
  - The class Starz for the the display is now changed but functioning the same. I just wrote it differently.
  I don't think this enough of a change, if its not its OKAY because the requirements are still backed up by the codes besides the Stars Class.
  */
  
  float x, y;  // Positions of the Stars
  float opacity;  // Opacity of the star
  
  // Constructor to initialize a star with its position and opacity
   Stars(float xPosition, float yPosition, float starOpacity)
    {
      
    x = xPosition; // Set X position
    y = yPosition; // Set Y position
    opacity = starOpacity;  // Set the opacity
    
    }
  
  // Method to display the star with mouse-dependent movement
  void display()
  {
    // Adjust star's position relative to mouse position
    float adjustedX = x - mouseX * .7; 
    float adjustedY = y - mouseY * .7;
    
    fill(255,255,255,opacity); // White color for stars
    ellipse(adjustedX, adjustedY, 3, 3); // Draw star
  
}

}

class Starz
{
  
  ArrayList<Stars> starCapacity; // List to hold multiple star objects

Starz() 
{
  
    int numberOfStars =  800;
    starCapacity = new ArrayList<Stars>();
    
    // Initialize the stars with random positions
    for (int i = 0; i < numberOfStars; i++) 
    {
      
      float starX = random(-width, 2 * width); // Allow positions off-screen
      float starY = random(-height, 2 * height);
      float starOpacity = random(50,255);  // Random opacity
      starCapacity.add(new Stars(starX, starY, starOpacity)); // Add the star to the list
      
    }
    
  }
    // Method to display all the stars in the starCapacity list
    void display()
  {
    
    for (int i = 0; i < starCapacity.size(); i++) 
    {
      
    Stars s = starCapacity.get(i); // Get the star
    s.display(); // Display each star with movement
    
  }
}
}
