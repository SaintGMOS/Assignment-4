

Starz starz;
Hud hud;

void setup()
{
  size(1000, 900); // Set the window size to 1000x1000 pixels
  starz = new Starz();
  hud = new Hud();
  noCursor();
  frameRate(60);
}

void draw()
{
  background(0);

  
  
  starz.display(); 
  hud.display();
  
  

  

  


}
