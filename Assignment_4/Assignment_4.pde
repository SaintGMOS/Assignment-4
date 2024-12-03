 /*
 SAVE THIS FOR OTHER PURPOSES IN THE FUTURE
    for (int i = 0; i < 5; i++)
  {
    enemies.add(new Enemy(new PVector(random(100, width - 100), -30))); // Enemies start just above the top
  }
  */

PImage pirate; // Image for enemies
Starz starz;
Hud hud;
ArrayList<Enemy> enemies;
int score;
int spawnRate = 120; // Spawn a new enemy every 120 frames (2 seconds at 60 FPS)
int spawnTimer = 0;

boolean shotTaken = false; // Variable to track if a shot was taken

void setup()
{
  size(1000, 900); // Set the window size to 1000x900 pixels
  pirate = loadImage("SP1.png"); // Load the enemy image
  starz = new Starz();
  hud = new Hud();
  enemies = new ArrayList<Enemy>();
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

  // Update and display enemies
  for (int i = enemies.size() - 1; i >= 0; i--)
  {
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.display();

    // Check for shooting collision if a shot has been taken
    if (shotTaken && enemy.checkHit(mouseX, mouseY)) 
    {
      enemy.isHit = true; // Set the enemy as hit
      enemy.exploded = true; // Trigger explosion effect
      createExplosion(enemy.position.x, enemy.position.y); // Trigger explosion
      enemies.remove(i); // Remove the enemy after it is hit
      score += 10; // Increment score when an enemy is hit
    }

    // Remove enemies that move off the bottom of the screen
    if (enemy.position.y > height + enemy.size / 2) 
    {
      enemies.remove(i);
    }
  }

  // Reset shotTaken after checking for collisions
  shotTaken = false;
  
  hud.display();
}

void mousePressed()
{
  shotTaken = true; // Set shotTaken to true when the mouse is pressed
}

void createExplosion(float x, float y)
{
  for (int i = 0; i < 20; i++) 
  {
    stroke(random(255), random(255), random(255));
    strokeWeight(2);
    ellipse(x, y, x + random(-50, 50), y + random(-50, 50));
    // Change The size and coloring 
  }
}
