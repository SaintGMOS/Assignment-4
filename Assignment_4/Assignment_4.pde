Starz starz;
Hud hud;
PImage pirate; // Image for enemies
PImage title;
PImage back;
ArrayList<Enemy> enemies;
ArrayList<Laser> lasers; // Array list to store lasers
int spawnRate = 50; // Spawn a new enemy every # frames 
int spawnTimer = 0;
boolean shotTaken = false; // Variable to track if a shot was taken
PFont font;
float effectMoverT;
float effectMoverS;
float colorChange;
int roundedGoal;
int health;
int initialCircle;
int circleRepeat;
boolean repeat;
boolean gameOver;
boolean startScreen;

void setup()
{
  
  size(1000, 900); // Set the window size to 1000x900 pixels
  pirate = loadImage("SP1.png"); // Load the enemy image
  title = loadImage("SPT.png");
  back = loadImage("BSPACE.png");
  starz = new Starz();
  hud = new Hud();
  enemies = new ArrayList<Enemy>();
  lasers = new ArrayList<Laser>(); // Initialize laser array
  circleRepeat = 0;
 initialCircle = 5;
  health = 4;
  font = createFont("8bit.ttf",64); 
  textFont(font);
  frameRate(60);
  noCursor();
  repeat = false;
  gameOver = false;
  startScreen = true;
  
}

void draw()
{
  background(0);
  effectMoverT = random(0,1);
  effectMoverS = random(0,10);
 
  // Start Screen 
   if(startScreen)
  {
    
  rectMode(CENTER);  
  fill(#959595);
  rect(width/2,height/2,width,height);
  imageMode(CENTER);
  image(title,(width/2+30),(height/2-50),600+effectMoverS,300+effectMoverS);  
  image(pirate,(width/2+250)+effectMoverT,(height/2+190)+effectMoverT,70+effectMoverS,70+effectMoverS);  
  rectMode(CENTER);

  textSize(25);
  fill(0);
  text("Press ENTER to Start",(width/2-155)-effectMoverT , (height/2 + 200)-effectMoverT );
  
   if(key == ENTER && keyPressed)
  {
  
   startScreen = false;
   startNewGame();
   repeat = true;
  }
 
  }
  
  else if(gameOver)
  {
  
    rectMode(CENTER);
    fill(255, 0, 0);
    initialCircle = 5;
    circleRepeat += 15;
    for(int i = 0; i < 5; i++)
    {
      stroke(20);
      ellipse(width/2, height/2, initialCircle+circleRepeat, initialCircle+circleRepeat);
      
    }
    image(pirate,(width/2+30),(height/2),600+effectMoverS,500+effectMoverS);  
    image(back,(width/2),(height/2+250),100,100);  
  
   if (keyPressed && key == BACKSPACE) 
   {
      gameOver = false;
      startScreen = true;
    }
  }
  
  
  
  
  
 
  else if(repeat)
{
  spawnTimer++;
  starz.display();
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
      if (enemy.explosionTimer <= -50)  // Change the Value for how long the explosion last for
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

        
      }
      
    }

    // Remove enemies that move off the bottom of the screen
    if (enemy.position.y > height + enemy.size / 2) 
    
    {
      enemies.remove(i);
      health -= 1;
      println(health);
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
  colorChange = .001 * frameCount;
  textSize(18);
  fill(255,255,255,220);
  text("Health " + health, width/2-53,67);
  
  if( health <= 0)
  {
    repeat = false;
    gameOver = true;
  
  }
  
  
  
 
  
}

}
void mousePressed()
{
  
  shotTaken = true; // Set shotTaken to true when the mouse is pressed
  int laserColor = color(random(255),random(255),random(255)); // Red color for the laser
  lasers.add(new Laser(width/2, height-90, mouseX, mouseY, laserColor)); //You can use this to change thee origin
  
  
}

void startNewGame()
{
  enemies.clear();
  lasers.clear();
  health = 4;
  spawnTimer = 0;
  repeat = false;

}
