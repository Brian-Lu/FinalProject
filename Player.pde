class Player extends Person{
   int light,lives,keys;
   int EditX, EditY;
   Player(){
     super(); 
     light = 50;
     lives = 5;
     keys = 0;
     EditX = -1;
     EditY = -1;
   }
   Player(float Xpos,float Ypos,float Speed, int Health){
     super(Xpos,Ypos,Speed,Health); 
     light = 50;
     lives = 5;
     keys = 0;
     EditX = -1;
     EditY = -1;
   }
   Player(float Xpos,float Ypos,int Speed, int Health,int editx,int edity){
    this(Xpos,Ypos,Speed,Health);
    EditX = editx;
    EditY = edity;
   }
   void editReset(){
     xpos = EditX;
     ypos = EditY;
   }
   void move(){
     if (key == CODED){
       if(keyCode == UP){
         ypos -= speed * 1.0;
       }if(keyCode==DOWN){
         ypos += speed * 1.0;
       }if(keyCode==RIGHT){
         xpos += speed * 1.0;
       }if(keyCode==LEFT){
         xpos -= speed * 1.0;
       }
     }
   }
   void addKey(){
     keys += 1; 
   }
   boolean hasKEY(){
     if(keys>0){
        return true;
     }
     return false;
   }
   
   void display(){
      image(imgP, xpos - 10, ypos - 15, 20, 30);
      /*
      if(mode == 1){
        fill(0);
        rect(0, 0, 1000, ypos - light);
        rect(0, 0, xpos - light, 1000);
        rect(0, ypos + light, 1000, 1000);
        rect(xpos + light, 0, 1000, 1000);
      }
      Disabled for testing reasons
      
      */
      
      
      /*rect( xpos - 10, ypos + 10, 20, 40);
      line(xpos + 10, ypos + 20, xpos + 15, ypos + 5);
      line(xpos - 10, ypos + 20, xpos - 15, ypos + 5);
      line(xpos + 10, ypos + 50, xpos + 15, ypos + 60);
      line(xpos - 10, ypos + 50, xpos - 15, ypos + 60);
      */
   }
   
}