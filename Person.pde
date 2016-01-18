class Person{
   int health,speed,keys;
   float xpos,ypos;
   Person(){
     health = 100;
     speed = 1;
     xpos = 70;
     ypos = 70;
     keys = 0;
   }
   Person(float Xpos, float Ypos,int Speed, int Health){
     health = Health;
     xpos = Xpos;
     ypos = Ypos;
     speed = Speed;
     keys = 0;
   }
}