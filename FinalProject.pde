int x = 100;
Player P1;
void setup(){
  size(100, 100);
  P1 = new Player(20.0,20.0,100);
 
}

void draw(){
  background(204);
  P1.display();
  P1.move();
}

class Player{
   int health;
   int speed;
   int light;
   float xpos;
   float ypos;
   
   Player(float Xpos, float Ypos, int Health){
     health = Health;
     xpos = Xpos;
     ypos = Ypos;
     speed = 2;
     light = 30;
   }
   void takeDamage(){
     
   }
   void move(){
     if (keyPressed == true){
       if (key == CODED){
         if(keyCode == UP){
           ypos -= speed * 1.0;
         }else if(keyCode==DOWN){
           ypos += speed * 1.0;
         }else if(keyCode==RIGHT){
           xpos += speed * 1.0;
         }else if(keyCode==LEFT){
           xpos -= speed * 1.0;
         }
       }
     }
   }
   void display(){
      ellipse(xpos,ypos,10,10);
   }
}
/*
int x = 20;
void setup() {
  size(100, 100);
  strokeWeight(4);
} 

void draw() {
  background(204);
  if (keyPressed == true) { // If the key is pressed
    x++; // add 1 to x
  } 
  line(x, 20, x-60, 80);
}*/