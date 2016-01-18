class Guard extends Person{
   int type, dir;
   boolean alert;
   int change;
   String direction;
   Guard(){
     super();
     alert = false;
     type = 1;
   }
   Guard(float Xpos,float Ypos,int Speed, int health){
     super(Xpos,Ypos,Speed,health);
     alert = false;
     type = 1;
     change = 0;
   }
   Guard(float Xpos, float Ypos, int Speed, int health, int Type) {
     this(Xpos, Ypos, Speed, health);
     type = Type;
     change = 0;
   }
   void chase(Player P){
     if (P.xpos == xpos && P.ypos == ypos) {
       P.lives -= 1;
     }
     if (P.xpos > xpos){
       xpos += speed*1.0;
     }
     if(P.xpos < xpos){
       xpos -= speed*1.0;
     }
     if(P.ypos > ypos){
       ypos += speed*1.0;
     }
     if(P.ypos < ypos){
       ypos -= speed*1.0;
     }
   }
   void display(){
     fill(250,250,0);
     rect(xpos,ypos,5,5); 
   }
   void move() {
     if(change == 0){
       dir = int(random(1,4));
       change = 10;
     }
     if (dir == 1){
       ypos -= 1; 
     }else if (dir == 2){
       xpos += 1; 
     }else if (dir == 3){
       ypos += 1;
     }else{
       xpos -= 1;
     }
     change--;
   }
}