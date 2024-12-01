class Hud
{
 
    float colorChange;
    float videoEffect;

  
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
    
    //  Red Butttons 
   
    videoEffect += 2;
    
    colorChange = .001 * frameCount;
    
    fill(map(noise(colorChange), 0, 1, 150, 240), 0, 0); // Neon Red
    
    rect(100,800,100,20);
    rect(200,800,50,20);
    rect(250,800,20,20);
    rect(140,825,175,10);
    ellipse(240,825,10,10);
    ellipse(260,825,10,10);
    rect(80,860,20,30);
    rect(150,860,50,20);
    ellipse(220,860,30,30);
    
    
    // White Effect on Red Buttons
    fill(map(noise(colorChange), 0, 1, 150, 255), 255, 255,150); // White
    rect(100,map(noise(videoEffect),0,1,785,805),100,1);
    rect(100,map(noise(videoEffect),0,1,790,810),100,1);
    rect(100,map(noise(videoEffect),0,1,795,815),100,1);
    
    rect(200,map(noise(videoEffect),0,1,785,805),50,1);
    rect(200,map(noise(videoEffect),0,1,790,810),50,1);
    rect(200,map(noise(videoEffect),0,1,795,815),50,1);
    
    rect(250,map(noise(videoEffect),0,1,785,805),20,1);
    rect(250,map(noise(videoEffect),0,1,790,810),20,1);
    rect(250,map(noise(videoEffect),0,1,795,815),20,1);
    
    
    rect(140,map(noise(videoEffect),0,1,815,835),175,1);
    
    rect(240,map(noise(videoEffect),0,1,820,828),10,1);
 
    rect(260,map(noise(videoEffect),0,1,820,828),10,1);
    
    rect(80,map(noise(videoEffect),0,1,845,850),20,1);
    rect(80,map(noise(videoEffect),0,1,850,855),20,1);
    rect(80,map(noise(videoEffect),0,1,855,860),20,1);
    rect(80,map(noise(videoEffect),0,1,860,865),20,1);
    rect(80,map(noise(videoEffect),0,1,865,870),20,1);
    rect(80,map(noise(videoEffect),0,1,870,875),20,1);
    
    rect(150,map(noise(videoEffect),0,1,845,875),50,1);
    rect(150,map(noise(videoEffect),0,1,855,870),50,1);
    
    rect(220,map(noise(videoEffect),0,1,845.,875),30,1);
    
    
    
  // Health Bars Red
  fill(255,0,0,180);
  rect(width/2, 60,180,20);
  fill(255,0,0,150);
  rect(width/2, 60,90,50);
  
  // Health Bars White
  fill(map(noise(colorChange), 0, 1, 150, 255), 255, 255,100); // White
  rect(width/2,map(noise(videoEffect),0,1,50,65),180,1);
  rect(width/2,map(noise(videoEffect),0,1,25,95),90,1);
  
  
  // Joystick
   drawJoystick();


  
  
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
  
  void drawJoystick() 
  {
    
    strokeWeight(5);
    stroke(#313131);
    float positionChange = 0;
    
    for(int i = 0; i < 2; i++)
    {
    
    if(i == 1)
    {
      positionChange = 190;
    
    }
    float baseX = width / 2 - 90+ positionChange;
    float baseY = height +40;
    float stickWidth = 40;
    float stickHeight = 100;

    // Calculate joystick tilt based on mouseX position
    float centerX = width / 2;
    float range = 70; // Range for the joystick tilt

    // Calculate tilt based on horizontal mouse position
    float dx = mouseX - centerX;
    float maxTilt = radians(20); // Maximum joystick tilt in radians
    float tiltX = map(constrain(dx, -range, range), -range, range, -maxTilt, maxTilt);

    pushMatrix();
    translate(baseX, baseY);

    // Stick with tilt
    fill(#555555);
    pushMatrix();
    rotate(tiltX); // Apply rotation based on tiltX
    rect(0, -stickHeight, stickWidth * 0.4, stickHeight);
    popMatrix();


    popMatrix();
    
    // Base of joystick
    fill(#313131);
    rect(width/2, height-10, 275,30);
    }
    
  }
  

  
  

}
