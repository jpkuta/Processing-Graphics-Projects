class Planet{
float distance;
float radius;
float angle;
int red;
int green;
int blue;
float orbitSpd;

Planet(float d, float r, int R, int g, int b){
  distance = d;
  radius = r;
  green = g;
  blue = b;
  red = R;
  orbitSpd = random(.005, .05);
  angle = random(0, 2*PI);
  
}

void orbit(){
 angle = angle + orbitSpd/3; 
}

void moonOrbit(){
   angle = angle + orbitSpd; 
}
  
  void draw(){
   rotate(angle);  
   translate(distance,0);
   fill(red,green,blue);
   ellipse(0,0,radius*2,radius*2); 
  }
  
}
