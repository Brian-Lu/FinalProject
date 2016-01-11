int x = 100;
Player P1;
Guard g1;
ArrayList<Guard> Guards = new ArrayList<Guard>(1);


void setup(){
  size(1000, 1000);
  P1 = new Player(20.0,20.0,2,100);
  Guard g1 = new Guard(80.0,80.0,1,100);
  Guards.add(g1);
}
void patrol(){
  if(Guards.size() >= 1){
    for(Guard guard : Guards){
      if (P1.xpos - guard.xpos <= 100){
        guard.alert = true;
        guard.chase(P1);
      }
    }
  }
}
void draw(){
  background(204);
  P1.display();
  for(Guard guard : Guards){
    guard.display();
  }
  P1.move();
  patrol();
}
void keyPressed(){
  P1.move(); 
}

class Person{
   int health;
   int speed;
   float xpos;
   float ypos;
   
   Person(){
     health = 100;
     speed = 1;
     xpos = 80;
     ypos = 80;
   }
   Person(float Xpos, float Ypos,int Speed, int Health){
     health = Health;
     xpos = Xpos;
     ypos = Ypos;
     speed = Speed;
   }
}
class Player extends Person{
   int light;
   Player(){
     super(); 
     light = 20;
   }
   Player(float Xpos,float Ypos,int Speed, int Health){
     super(Xpos,Ypos,Speed,Health); 
     light = 20;
   }
   void move(){
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
   void display(){
      ellipse(xpos,ypos,10,10);
   }
   
}
class Guard extends Person{
   boolean alert;
   int resetTime;
   Guard(){
     super();
     alert = false;
   }
   Guard(float Xpos,float Ypos,int Speed, int health){
     super(Xpos,Ypos,Speed,health);
     alert = false;
   }
   void chase(Player P){
     if (P.xpos > xpos){
       xpos += speed*1.0;
     }else if(P.xpos < xpos){
       xpos -= speed*1.0;
     }else if(P.ypos > ypos){
       ypos += speed*1.0;
     }else if(P.ypos < ypos){
       ypos -= speed*1.0;
     }
   }
   void display(){
     rect(xpos,ypos,5,5); 
   }
}