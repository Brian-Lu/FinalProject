class Person{
   int health;
   int speed;
   float xpos;
   float ypos;
   
   Person(){
     health = 100;
     speed = 1;
     xpos = 70;
     ypos = 70;
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
      ellipse(xpos,ypos,20,20);
      /*rect( xpos - 10, ypos + 10, 20, 40);
      line(xpos + 10, ypos + 20, xpos + 15, ypos + 5);
      line(xpos - 10, ypos + 20, xpos - 15, ypos + 5);
      line(xpos + 10, ypos + 50, xpos + 15, ypos + 60);
      line(xpos - 10, ypos + 50, xpos - 15, ypos + 60);
      */
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