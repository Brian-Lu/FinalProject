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
     if (P.xpos == xpos && P.ypos == ypos) {
       P.lives -= 1;
     }
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
