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
int frameCounter = 0;

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
  // Create initial enemies at the top of the screen
  for (int i = 0; i < 5; i++)
  {
    // Pass the enemy image to each new enemy
    enemies.add(new Enemy(new PVector(random(100, width - 100), -30), pirate));
  }
}

void draw()
{
  background(0);

  starz.display();
  hud.display();

  frameCounter++;

  // Spawn new enemy based on spawnRate
  if (frameCounter >= spawnRate) 
  {
    // Pass the enemy image to each new enemy
    enemies.add(new Enemy(new PVector(random(100, width - 100), -30), pirate));
    frameCounter = 0; // Reset the counter
  }

  // Update and display enemies
  for (int i = enemies.size() - 1; i >= 0; i--) 
  {
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.display();
    enemy.checkHit();

    // Remove enemies that move off the bottom of the screen
    if (enemy.position.y > height + enemy.size / 2)
    {
      enemies.remove(i);
    }
  }
}
