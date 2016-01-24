class Guard extends Person{
   int type, dir,numPosts;
   int change;
   String direction;
   float[][] Posts;
   boolean lookingFor;
   int lookingForPost;
   Guard(){
     super();
     type = 1;
     Posts = new float[10][2];
     Posts[0][0] = xpos;
     Posts[0][1] = ypos;
     lookingFor = false;
     lookingForPost = 0;
   }
   Guard(float Xpos,float Ypos,int Speed, int health){
     super(Xpos,Ypos,Speed,health);
     type = 1;
     change = 0;
     Posts = new float[10][2];
     Posts[0][0] = xpos;
     Posts[0][1] = ypos;
     lookingFor = false;
     lookingForPost = 0;
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
     if (type == 1) {
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
     if (type == 2) {
       if(lookingFor) {
         if(Posts[lookingForPost][0] > xpos) {
           xpos += speed *1.0;
         }
         if(Posts[lookingForPost][0] < xpos) {
           xpos -= speed * 1.0;
         }
         if(Posts[lookingForPost][1] > ypos) {
           ypos += speed * 1.0;
         }
         if(Posts[lookingForPost][1] < ypos) {
           ypos -= speed * 1.0;
         }
         if(xpos == Posts[lookingForPost][1] && ypos == Posts[lookingForPost][2]){
           if(lookingForPost > numPosts){
              lookingForPost = 0; 
           }else{
              lookingForPost += 1;
           }
         }
       }
     }     
   }
}