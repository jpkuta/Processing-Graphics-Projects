/**
Justin Kuta
jpkuta@stcloudstate.edu
Assignment 4 - polgon with multiple images

Description: This program displays a Google Earth image of the SCSU campus, allows users to draw a polygon on top of this image. The perimiter of the polygon is calculated, converted to feet and displayed.

Controlls: 


**/
//Globals
ArrayList<point> points = new ArrayList<point>();
boolean complete = false;
int i = 0;
int methodNumber = 1; //Method one: click to complete , Method two: keypress to complete
PImage bkgrnd;
boolean show = true;
float perimeter = 0;
boolean update = false;
boolean changeMethod = true;

void setup(){
  background(0);
  size(1569,935);
  stroke(255);
  textSize(20);
  bkgrnd = loadImage("Assignment3.png");
}

//Add polygon 'points' when mouse is click and polygon is incomplete
void mouseClicked()
{
  if(!complete){
 point p = new point(mouseX,mouseY);
 points.add(p);
  }
}

void draw(){
image(bkgrnd, 0, 0);
DrawLine();
updatePerimeter();
lockDrawMethod();
movePoint();
text("Press '`' To Toggle Help ", 25, 30 );
if(show){
  text("Number of points: " + points.size(),25,50);
  text("Drawing Mode: " + methodNumber, 25 , 65);
  text("Perimeter Length = "+ perimeter , 25, 80);
  text("Press 'r' to reset ", 25, 95);
  text("Press 'spacebar' to change methods", 25, 110);
  if(methodNumber == 2){
    text("Press 'c' To Complete Polygon ", 25, 125);
  }
}
text("Number of points: " + points.size(), 1200, 900);
  text("Perimeter Length = "+ perimeter , 1200, 915);
if(complete)
            {
  text("Complete", 1300,800);
             }
}

 //This function listens to key presses
 void keyPressed()
 {
 if (key == '`')
     show = !show;
else if (key == 'r')
  reset();
else if (key == ' ' & changeMethod == true)
       if (methodNumber == 1)
       methodNumber = 2;
       else
       methodNumber = 1;
else if (methodNumber == 2 &  key == 'c')
        complete = true;

 }
 
 //function to reset all settings to default
void reset(){
points = new ArrayList<point>();
complete = false;
i = 0;
perimeter = 0;
changeMethod = true;
 }
 
 void lockDrawMethod(){
   if (points.size() > 0){
     changeMethod = false;
                         }
 }
 

//Connects polygon verticies with lines to create polygons
void DrawLine(){
if  (points.size() > 1)
  {
    for(i = 1; i < points.size(); i = i+1){
    line(float(points.get(i-1).getPX()),float(points.get(i-1).getPY()),float(points.get(i).getPX()),float(points.get(i).getPY()));
    drawPoint(i);  
}
  //The following is for closing the polygon with method one. If the polygon is incomplete and the first point is clicked, the polygon is then completed
  if(complete == false & methodNumber == 1){
    if(abs(points.get(0).getPX() - points.get(points.size()-1).getPX()) < 6 & abs(points.get(0).getPY() - points.get(points.size()-1).getPY()) < 6 & complete != true)
    {
     points.remove(i-1);
     complete = true; 
    //points.remove(points.size()-1); 
    }
  }
    if(complete == true){
     line(float(points.get(points.size()-1).getPX()),float(points.get(points.size()-1).getPY()),float(points.get(0).getPX()),float(points.get(0).getPY()));
    }
  }
}


void drawPoint(int i){
  stroke(20, 220, 15);
  rect((float(points.get(i-1).getPX()-2)),float(points.get(i-1).getPY()),5,5);
  if(complete == true)
  {
       rect((float(points.get(i).getPX()-2)),float(points.get(i).getPY()),5,5);
  }
 
}

//Calculate the perimeter of the polygon by finding the length of each side multipled by the pixel to feet factor (1.425 ft per pixel)
void updatePerimeter(){
  if (points.size() > 1){
    perimeter = 0;
    for(i = 1; i < points.size(); i = i+1){
    perimeter = perimeter + (dist(float(points.get(i-1).getPX()),float(points.get(i-1).getPY()),float(points.get(i).getPX()),float(points.get(i).getPY())) * 1.425);                                  
      
                                          }
    if(complete == true){
                         perimeter = perimeter + (dist(float(points.get(i-1).getPX()),float(points.get(i-1).getPY()),float(points.get(0).getPX()),float(points.get(0).getPY())) * 1.425);
                        }
                      }
}

//Allow points to be moved when n-gon is complete
void movePoint(){
   if(complete){
     for( i = 0; i < points.size(); i = i +1){ 
     if( dist(float(points.get(i).getPX()),float(points.get(i).getPY()),mouseX,mouseY) < 15 & mousePressed){
       points.get(i).setPX(mouseX);
       points.get(i).setPY(mouseY);
     }      
   }
}
}
