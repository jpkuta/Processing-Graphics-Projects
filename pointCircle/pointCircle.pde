/**
Justin Kuta
jpkuta@stcloudstate.edu
Assignment 5 - 3 Point Circle
Description: Click and drag to move points. If points are not in a line. a circle which connects all the points will be drawn.
Press the 'r' key to reset points to their original position.

**/

//Globals
Point A;
Point B;
Point C;
boolean inLine = true;
float radius;

void setup(){
  background(0);
  size(800,800);
  A = new Point(150,400);
  C = new Point(400,400);
  B = new Point(650,400);
  
}

void draw(){
 background(0); 
 
 
  calculateElements(A,B,C);
 
 A.draw();
 A.move();
 B.draw();
 B.move();
 C.draw();
 C.move();
 
 checkLine();
 
 
 text("Points in line is: " + inLine, 20,20);
 
}

//Check if points are inline. If the area of triangle ABC is 0, points are in a line. Circle may not be drawn if points are inline.
void checkLine(){
if( ( A.getPX() * (B.getPY() - C.getPY()) + B.getPX() * (C.getPY() - A.getPY()) + C.getPX() * (A.getPY() - B.getPY()) ) == 0){
  inLine = true;
}
  else{
   inLine = false; 
  }
}

 void keyPressed(){
  if(key == 'r'){
    reset();
  }
 }
 
 void calculateElements(Point A, Point B, Point C){
   if(inLine == false){

     //First Perpendicular Bisector
   int  x1 = (B.getPX() + A.getPX())/2;
   int  y1 = (B.getPY() + A.getPY())/2;
   int dy1 = B.getPX() - A.getPX();
   int  dx1 = -(B.getPY() - A.getPY());
     
     //Second Perpendicular Bisector
     int x2 = (C.getPX() + B.getPX())/2;
     int y2 = (C.getPY() + B.getPY())/2;
     int dy2 = C.getPX() - B.getPX();
     int dx2 = -(C.getPY() - B.getPY());
     
     //Calculate intersect, this will be the center of the circle
     Point p1 = new Point(x1, y1);
     Point p2 = new Point(x1 + dx1, y1 + dy1);
     Point p3 = new Point(x2, y2);
     Point p4 = new Point(x2 + dx2, y2 + dy2);
      //segments
     float dx12 = p2.getPX() - p1.getPX();
     float dy12 = p2.getPY() - p1.getPY();
     float dx34 = p4.getPX() - p3.getPX();
     float dy34 = p4.getPY() - p3.getPY();
     
     float denominator = (dy12 * dx34 - dx12 * dy34);
     float t1 = ((p1.getPX() - p3.getPX()) * dy34 + (p3.getPY() - p1.getPY()) * dx34)/denominator;
     
     Point intersection = new Point(int(p1.getPX() + dx12 * t1), int(p1.getPY() + dy12 * t1));
     //intersection.draw();
     radius = dist(B.getPX(), B.getPY(), intersection.getPX(), intersection.getPY());
      stroke(255,0,0);
      noFill();
      ellipseMode(RADIUS);
      ellipse(intersection.getPX(),intersection.getPY(),radius,radius);
     
   }
 }
 
 
 void reset(){
   A.setPoints(150,400);
   B.setPoints(400,400);
   C.setPoints(650,400);
 }
