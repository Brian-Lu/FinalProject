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

