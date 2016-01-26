class Person{
   float health,speed;
   float xpos,ypos;
   Person(){
     health = 100;
     speed = 1;
     xpos = 70;
     ypos = 70;
   }
   Person(float Xpos, float Ypos,float Speed, int Health){
     health = Health;
     xpos = Xpos;
     ypos = Ypos;
     speed = Speed;
   }
}