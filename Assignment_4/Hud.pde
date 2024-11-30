class Hud
{
  
  void display()
  {
    
    
    rectMode(CENTER);
    noStroke();
    // Metal/Gray Boarders
    fill(#959595);
    rect(width/2, height-40,width+200,180);
    rect(10,height/2, 40,height);
    rect(990,height/2, 40,height);
    rect(width/2, 20,width,40);
    rect(width/2, 20,width,40);
    rect(width/2, 60,200,60);
    triangle(300,30,400,30,400,90);
    triangle(700,30,600,90,600,30);
    
  // Health Bars
  fill(255,0,0,200);
  rect(width/2, 60,180,20);
  fill(255,0,0,150);
  rect(width/2, 60,90,50);
  
  // Crosshair
  int crosshairPlacementX = width/2;
  int crosshairPlacementY = height/2;
  noFill();  
  strokeWeight(.5);
  
  if(mousePressed)
  {
  strokeWeight(1);
  stroke(255,0,0);
  }
  else
  {
  stroke(255,255,255,180);
  }
  
  ellipse(crosshairPlacementX, crosshairPlacementY, 80, 80);
  ellipse(crosshairPlacementX, crosshairPlacementY, 35, 35);
  rect(crosshairPlacementX + 30, crosshairPlacementY, 50, 1);
  rect(crosshairPlacementX - 30, crosshairPlacementY, 50, 1);
  rect(crosshairPlacementX, crosshairPlacementY - 30, 1, 50);
  rect(crosshairPlacementX, crosshairPlacementY + 30, 1, 50);
  noStroke();
  }
  
  
  

  
  

}
