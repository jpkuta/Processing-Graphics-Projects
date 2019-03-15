/**
Justin Kuta
jpkuta@stcloudstate.edu
Assignment 6 - Solar System
Description: This program simulates a small solar system with a sun centered in the window,8 planets, 3 with moons.
**/

//Globals
Planet sun;
Planet p1;
Planet m1;
Planet p2;
Planet p3;
Planet p4;
Planet m4;
Planet p5;
Planet p6;
Planet p7;
Planet m7;
Planet p8;
PImage bkgrnd;

void setup(){
  background(0);
  size(1200,1000);
  bkgrnd = loadImage("star.png");
  
  //Creating Planets, Moons and Star
  sun = new Planet(0,50,250, 230, 10);
  p1 = new Planet(110,19,30,240,232);
  m1 = new Planet(35,6,212, 219, 188);
  p2 = new Planet(200,23,40,10,10);
  p3 = new Planet(240,11,49,249,0);
  p4 = new Planet(290,14,193,7,88);
  m4 = new Planet(35,7,250,250,250);
  p5 = new Planet(350,44.7,196,255,250);
  p6 = new Planet(375,30,120,74,145);
  p7 = new Planet(440,18,247,17,78);
  m7 = new Planet(38,9,234,255,153);
  p8 = new Planet(515,27,242,66,26);
}

void draw(){
  image(bkgrnd, 0, 0);
  //Translating origin to the center of the window and drawing the sun
  translate(width/2,height/2);
  sun.draw();
  
  //Drawing the planets and their moons, using matrix stack operations
  pushMatrix();
  p1.draw();
  p1.orbit();
  m1.draw();
  m1.moonOrbit();
  popMatrix();
  
  pushMatrix();
  p2.draw();
  p2.orbit();
  popMatrix();
  
  pushMatrix();
  p3.draw();
  p3.orbit();
  popMatrix();
  
  pushMatrix();
  p4.draw();
  p4.orbit();
  m4.draw();
  m4.moonOrbit();
  popMatrix();
    
  pushMatrix();
  p5.draw();
  p5.orbit();
  popMatrix();
 
  pushMatrix();
  p6.draw();
  p6.orbit();
  popMatrix();
  
  pushMatrix();
  p7.draw();
  p7.orbit();
  m7.draw();
  m7.moonOrbit();
  popMatrix();
 
  pushMatrix();
  p8.draw();
  p8.orbit();
  popMatrix();
  
}
