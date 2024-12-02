Starz starz;
Hud hud;
PImage pirate; // Image for enemies
ArrayList<Enemy> enemies;
ArrayList<Laser> lasers; // Array list to store lasers
int score;
int spawnRate = 60; // Spawn a new enemy every # frames 
int spawnTimer = 0;
boolean shotTaken = false; // Variable to track if a shot was taken


void setup()
{
  
  size(1000, 900); // Set the window size to 1000x900 pixels
  pirate = loadImage("SP1.png"); // Load the enemy image
  starz = new Starz();
  hud = new Hud();
  enemies = new ArrayList<Enemy>();
  lasers = new ArrayList<Laser>(); // Initialize laser array
  score = 0;
  noCursor();
  frameRate(60);
  
}

void draw()
{
  background(0);
  starz.display();
  
  spawnTimer++;

  // Spawn new enemy based on spawnRate
   if (spawnTimer >= spawnRate) 
  {
    
    enemies.add(new Enemy(new PVector(random(100, width - 100), -30))); // Add a new enemy
    spawnTimer = 0; // Reset frame counter (Basically If I remove this You'll get swarmed..DONT remove it
    
  }

   // Update and display all enemies
for (int i = enemies.size() - 1; i >= 0; i--) {
  Enemy enemy = enemies.get(i);

  if (enemy.exploded) 
  {
    
    // Display explosion particles
    for (int j = 0; j < 10; j++)
    {
      
      stroke(random(255), random(255), random(255));
      strokeWeight(2);

      // Adjust explosion particle positions to move with the mouse
      float explosionShiftX = random(30, 100);
      float explosionShiftY = random(30, 100);

      // Calculate the particle's(Basically Explosion Position but idk) position relative to the mouse
      float particleX = enemy.position.x - (mouseX - enemy.position.x) * .7;
      float particleY = enemy.position.y - (mouseY - enemy.position.y) * .7;

      fill(random(255));
      ellipse(particleX, particleY, explosionShiftX, explosionShiftY);
      
    }


      // Decrease the explosion timer
      enemy.explosionTimer--;

      // Remove the enemy when the explosion ends
      if (enemy.explosionTimer <= -20) 
      {
        
        enemies.remove(i);
        
      }
      
    }
    else 
    {
      
      enemy.move();
      enemy.display();

      // Check for collision if a shot has been taken
      if (shotTaken && !enemy.exploded && enemy.checkHit(mouseX, mouseY))
      {
        
        enemy.exploded = true; // Mark as exploded
        enemy.explosionTimer = 30; // Explosion duration (e.g., 30 frames)
        score += 10; // Increment score
        
      }
      
    }

    // Remove enemies that move off the bottom of the screen
    if (enemy.position.y > height + enemy.size / 2) 
    
    {
      enemies.remove(i);
    }
    
  }

  // Reset shotTaken after checking for collisions
  shotTaken = false;
  
    // Update and display all lasers
  for (int i = lasers.size() - 1; i >= 0; i--)
  {
    
    Laser laser = lasers.get(i);
    laser.update();
    laser.display();
    
    if (laser.isOffScreen()) 
    {
      
      lasers.remove(i); // Remove laser if it goes off the screen
      
    }
  }
  
  hud.display();
  
}

void mousePressed()
{
  
  shotTaken = true; // Set shotTaken to true when the mouse is pressed
  int laserColor = color(random(255),random(255),random(255)); // Red color for the laser
  lasers.add(new Laser(width/2-150, height, mouseX, mouseY, laserColor)); //You can use this to change thee origin
  lasers.add(new Laser(width/2+150, height, mouseX, mouseY, laserColor)); //You can use this to change thee origin
  
}
