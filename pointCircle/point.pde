class Point{
int pointX, pointY;
int size = 6;


Point(int px, int py){
  pointX = px;
  pointY= py;
  }

  int getPX(){
    return pointX;
  }
  int getPY(){
    return pointY;
  }
  
 void setPoints(int x,int y){
    pointX = x;
    pointY = y;
  }
  

  void draw(){
    ellipseMode(RADIUS);
    fill(0, 255, 255);
    stroke(8, 219, 219);
    ellipse(pointX,pointY,size,size);
  }
  
  void move(){
   if(dist(mouseX,mouseY,pointX,pointY) < 20 & mousePressed){
    pointX = mouseX;
    pointY = mouseY;
   }
  }
  
}
