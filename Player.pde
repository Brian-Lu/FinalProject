class Player extends Person{
   int light;
   int lives;
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
