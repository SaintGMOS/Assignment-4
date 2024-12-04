// Title: Space Pirates 
// Name: Matteo Santos

/*
    Description:
    "Space Pirates" is an exciting arcade-style game where players navigate through an 
    endless cosmic battlefield, fighting off waves of enemy Space Pirate ships. Your goal 
    is to survive as long as possible, defeating enemies and protecting your health. 
    
      INSTRUCTIONS:
      ENTER: Start the game from the title screen.
      BACKSPACE: Restart the game after a game-over.
      Mouse: Move the crosshair to aim.
      Left Click: Fire lasers at enemies.
      Shoot quickly to defeat enemies before they reach the bottom of the screen!!!!!!!!.

*/


Starz starz; // Background star effect manager
Hud hud; // Heads-up display (HUD) manager
PImage pirate; // Image for enemies
PImage title; // Image for the game title
PImage back; // Background image for game over screen
ArrayList<Enemy> enemies; // List to store enemies
ArrayList<Laser> lasers; // List to store laser shots
int spawnRate = 40; // Spawn a new enemy every # frames 
int spawnTimer = 0; // Tracks time until next enemy spawn
boolean shotTaken = false; // Tracks whether the player has fired a shot
PFont font; // Tracks whether the player has fired a shot
float effectMoverT; // Random effect for subtle movement (title screen)
float effectMoverS; // Random effect for scaling (title screen)
float colorChange; // Dynamic color shift over time
int roundedGoal; // Placeholder for rounded health or goal visuals
int health; // Player's health
int initialCircle; // Base size for game over animation circles
int circleRepeat; // Incremental size for expanding circles
boolean repeat; // Game state flag for active gameplay
boolean gameOver; // Game state flag for game over screen
boolean startScreen; // Game state flag for start screen

void setup()
{
  
  size(1000, 900); // Set the window size to 1000x900 pixels
  pirate = loadImage("SP1.png"); // Load the enemy image
  title = loadImage("SPT.png"); // Load the title screen image
  back = loadImage("BSPACE.png"); // Load background image for game over screen
  starz = new Starz(); // Initialize star background 
  hud = new Hud(); // Initialize HUD manager
  enemies = new ArrayList<Enemy>(); // Initialize list to store enemies
  lasers = new ArrayList<Laser>(); // Initialize list to store lasers
  circleRepeat = 0; // Reset circle animation counter
  initialCircle = 5; // Base size for game over circles
  health = 4;  // Set initial player health
  font = createFont("8bit.ttf",64); // Load 8-bit font for retro style
  textFont(font);  // Apply font to text
  frameRate(60); // Set game frame rate to 60 FPS
  noCursor(); // Hide system cursor for immersive experience
  repeat = false; // Start with gameplay inactive
  gameOver = false; // Start with no game over condition
  startScreen = true; // Begin with the title screen
  
}

void draw()
{
  
  background(0); // Clear screen with black background
  effectMoverT = random(0,1); // Generate random horizontal animation offset
  effectMoverS = random(0,10); // // Generate random scaling animation offset
 
  // Start Screen 
   if(startScreen)
  {
  // Display start screen with title and animations
  rectMode(CENTER);  
  fill(#959595); // Grey background
  rect(width/2,height/2,width,height); // Centered rectangle
  imageMode(CENTER);
  image(title,(width/2+30),(height/2-50),600+effectMoverS,300+effectMoverS);  // Title Image
  image(pirate,(width/2+250)+effectMoverT,(height/2+190)+effectMoverT,70+effectMoverS,70+effectMoverS);   // Pirate Image
  rectMode(CENTER);
  textSize(25);
  fill(0); // Black text
  text("Press ENTER to Start",(width/2-155)-effectMoverT , (height/2 + 200)-effectMoverT );
  
  // Start the game when ENTER is pressed
   if(key == ENTER && keyPressed)
  {
  
   startScreen = false;
   startNewGame();
   repeat = true;
  }
 
  }
  
  else if(gameOver)
  {
    // Display game-over screen with animations
    rectMode(CENTER);
    fill(255, 0, 0);
    initialCircle = 5; // Reset initial circle size
    circleRepeat += 15; // Gradually increase circle size
    for(int i = 0; i < 5; i++)
    {
      stroke(20);
      ellipse(width/2, height/2, initialCircle+circleRepeat, initialCircle+circleRepeat);
      
    }
    
    // Show game-over visuals
    image(pirate,(width/2+30),(height/2),600+effectMoverS,500+effectMoverS);  
    image(back,(width/2),(height/2+250),100,100);  
  
   // Restart the game when BACKSPACE is pressed
   if (keyPressed && key == BACKSPACE) 
   {
      gameOver = false;
      startScreen = true;
    }
  }
  
  else if(repeat)
{
  // Main gameplay loop
  spawnTimer++; // Increment spawn timer
  starz.display(); // Draw moving star background
  
  // Spawn new enemy based on spawnRate
   if (spawnTimer >= spawnRate) 
  {
    
    enemies.add(new Enemy(new PVector(random(100, width - 100), -30))); // Add a new enemy
    spawnTimer = 0; // Reset frame counter (Basically If I remove this You'll get swarmed..DONT remove it
    
  }

   // Update and display all enemies
  for (int i = enemies.size() - 1; i >= 0; i--)
  {
  
    Enemy enemy = enemies.get(i);

    if (enemy.exploded) 
    {
    
    // Display explosion particles
      for (int j = 0; j < 10; j++)
      {
       // Explosion effect for destroyed enemies
        stroke(random(255), random(255), random(255));
        strokeWeight(2);

        // Adjust explosion particle positions to move with the mouse
        float explosionShiftX = random(30, 100);
        float explosionShiftY = random(30, 100);

        // Calculate the particle's(Basically Explosion Position but idk) position relative to the mouse
        float particleX = enemy.position.x - (mouseX - enemy.position.x) * .7;
        float particleY = enemy.position.y - (mouseY - enemy.position.y) * .7;

        fill(random(255));
        ellipse(particleX, particleY, explosionShiftX, explosionShiftY); // Explosion particles
        
      }


      // Decrease the explosion timer
      enemy.explosionTimer--;

      // Remove the enemy when the explosion ends
      if (enemy.explosionTimer <= -50)  // Change the Value for how long the explosion last for
      {
        
        enemies.remove(i);
        
      }
      
    }
    
    else 
    {
      
      enemy.move(); // Update enemy position
      enemy.display(); // Draw enemy

      // Check for collision if a shot has been taken
      if (shotTaken && !enemy.exploded && enemy.checkHit(mouseX, mouseY))
      {
        
        enemy.exploded = true; // Trigger explosion
        enemy.explosionTimer = 30; // Set explosion duration
  
      }
      
    }

    // Remove enemies that move off the bottom of the screen
    if (enemy.position.y > height + enemy.size / 2) 
    
    {
      
      enemies.remove(i);
      health -= 1; // Reduce health when enemy escapes
      println(health);
      
    }
    
  }

   // Reset shotTaken 
  shotTaken = false;
  
    // Update and display all lasers
  for (int i = lasers.size() - 1; i >= 0; i--)
  {
    
    Laser laser = lasers.get(i);
    laser.update(); // Move laser
    laser.display(); // Draw laser
     
    // Remove lasers off-screen
    if (laser.isOffScreen()) 
    {
      
      lasers.remove(i); // Remove laser if it goes off the screen    
    }
    
  }

  hud.display(); // Display HUD elements
  colorChange = .001 * frameCount; // Adjust HUD visuals over time
  textSize(18);
  fill(255,255,255,220);
  text("Health " + health, width/2-53,67); // Display health
  
  if( health <= 0)
  {
     // Trigger game-over state when health reaches 0
    repeat = false;
    gameOver = true;
  
  }
  
}
}  
void mousePressed()
{
  
  // Fire a laser when mouse is clicked
  shotTaken = true; // Set shotTaken to true when the mouse is pressed
  int laserColor = color(random(255),random(255),random(255)); // Random color for lasers
  lasers.add(new Laser(width/2, height-90, mouseX, mouseY, laserColor)); //You can use this to change thee origin
  
  
}

void startNewGame()
{
  // Reset game state
  enemies.clear();
  lasers.clear();
  health = 4;
  spawnTimer = 0;
  repeat = false;
  
}
