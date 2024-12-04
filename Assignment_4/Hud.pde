class Hud
{
    
    float colorChange;
    float videoEffect;
    
    PImage turret;
    float angle = 0; // Initial rotation angle
    void setup() 
    {
    turret = loadImage("Turret.png"); // Load the image
    }

  void display()
  {
    // Turret
    drawTurret();
    
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
    triangle(25,780,120,800,25,700);
    triangle(975,780,920,800,975,700);
    
    // Console
     strokeWeight(2);
     stroke(46,46,46);
     fill(54,54,54);
     rect(width/2,height-40,width-60,150);
    
    //  Red Butttons    
    videoEffect += .01;
    
    colorChange = .001 * frameCount;
    
    stroke(193,0,0);
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
    rect(width/2+275,height/2+390,320,40);

    
    // White Effect on Red Buttons
    noStroke();
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
  noStroke();
  fill(255,0,0,150);
  rect(width/2, 60,90,50);
  fill(255,0,0,180);
  stroke(162,0,0);
  rect(width/2, 60,180,20);
    
  // Health Bars White
  noStroke();
  fill(map(noise(colorChange), 0, 1, 150, 255), 255, 255,100); // White
  rect(width/2,map(noise(videoEffect),0,1,50,65),180,1);
  rect(width/2,map(noise(videoEffect),0,1,25,95),90,1);
  
  // Joystick
  drawJoystick();
  
  
   
  // Crosshair
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
  
  ellipse(mouseX, mouseY, 80, 80);
  ellipse(mouseX, mouseY, 35, 35);
  rect(mouseX + 30, mouseY, 45, 1);
  rect(mouseX  - 30, mouseY, 45, 1);
  rect(mouseX , mouseY - 30, 1, 45);
  rect(mouseX , mouseY + 30, 1, 45);
  
  // Top Left Lines
  rect(150,100,150,1);
  rect(75,175,1,150);
  // Bottom Right Lines
  rect(150,725,150,1);
  rect(75,650,1,150);
  // Top Right Lines
  rect(850,100,150,1);
  rect(925,175,1,150);
  // Bottom Right Lines
  rect(850,725,150,1);
  rect(925,650,1,150);
  
  noStroke();
 
  }
  
  void drawJoystick() 
  {
    
    float baseX = width / 2;
    float baseY = height +40;
    float stickWidth = 40;
    float stickHeight = 100;

    // Calculate joystick tilt based on mouseX position
    float centerX = width / 2;
    float range = 60; // Range for the joystick tilt

    // Calculate tilt based on horizontal mouse position
    float dx = mouseX - centerX;
    float maxTilt = radians(10); // Maximum joystick tilt in radians
    float tiltX = map(constrain(dx, -range, range), -range, range, -maxTilt, maxTilt);
    

    pushMatrix();
    translate(baseX, baseY);
    
    // Stick with tilt
    if (!mousePressed) 
    {     
      fill(#FF0000); // Red Button
      pushMatrix();
      rotate(tiltX);
      rect(0, -stickHeight - 50, stickWidth * 0.2, 5);
      popMatrix();
    }

    // Base stick with tilt
    stroke(28,28,28);
    strokeWeight(1);
    fill(#555555);
    pushMatrix();
    rotate(tiltX); // Apply rotation based on tiltX
    rect(0, -stickHeight, stickWidth * 0.4, stickHeight);
    rect(0, -stickHeight+25, 20, 10);
    popMatrix();

    // Base of joystick
    fill(#313131);
    rect(0, 0, 275, 30); // Adjusted base position to match joystick

    popMatrix();
    
    // Grey Rectangle Covering the end of th joystick
    fill(#555555);
    ellipse(width/2,height,80,30);
    
    }
    
     
 void drawTurret() 
  {
    
    float baseXT = width / 2;
    float baseYT = height -70;
    float stickWidthT = 80;
    float stickHeightT = 90;

    // Calculate jTurret tilt based on mouseX position
    float centerXT = width / 2;
    float rangeT = 160; // Range for the Turret tilt / Speed of how fast it turns

    // Calculate tilt based on horizontal mouse position
    float dxT = mouseX - centerXT;
    float maxTiltT = radians(50); // Maximum Turret tilt in radians 
    float tiltXT = map(constrain(dxT, -rangeT, rangeT), -rangeT, rangeT, -maxTiltT, maxTiltT);
    

    pushMatrix();
    translate(baseXT, baseYT);
    
    // Stick with tilt
    if (!mousePressed) 
    {     
      
      fill(36,36,36); // Red Button
      
    }
    
    pushMatrix();
     rotate(tiltXT);
     rect(0, -stickHeightT - 50, 15, 15);
     popMatrix();
    

    // Base stick with tilt
    stroke(28,28,28);
    strokeWeight(1);
    fill(#555555);
    pushMatrix();
    rotate(tiltXT); // Apply rotation based on tiltX
    rect(0, -stickHeightT, stickWidthT * 0.4, stickHeightT);
    rect(0, -stickHeightT+25, 20, 10);
    rect(0, -stickHeightT+15, 20, 10);
    rect(0, -stickHeightT+5, 20, 10);
    rect(0, -stickHeightT-5, 20, 10);
    rect(0, -stickHeightT-15, 20, 10);
    rect(0, -stickHeightT-25, 20, 10);
    rect(0, -stickHeightT-35, 20, 10);
    rect(0, -stickHeightT-45, 20, 10);
    popMatrix();


    popMatrix();
    
   
    }
    
    
    
    
    
    
}
