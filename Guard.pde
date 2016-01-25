class Guard extends Person{
   int type, dir;
   int change;
   String direction;
   ArrayList<Post> Posts;
   boolean lookingFor;
   int lookingForPost;
   Guard(){
     super();
     type = 1;
     Posts = new ArrayList<Post>(1);
     Posts.add(new Post(xpos,ypos));
     lookingForPost = 0;
   }
   Guard(float Xpos,float Ypos,int Speed, int health){
     super(Xpos,Ypos,Speed,health);
     type = 1;
     change = 0;
     Posts = new ArrayList<Post>(1);
     Posts.add(new Post(xpos,ypos));
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
     image(imgG, xpos - 10, ypos - 15, 20, 30); 
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
       print(lookingForPost);
       if(xpos == Posts.get(lookingForPost).xpos && ypos == Posts.get(lookingForPost).ypos){
           if(lookingForPost >= Posts.size()-1){
              lookingForPost = 0; 
           }else{
              lookingForPost += 1;
           }
       }
         if(Posts.get(lookingForPost).xpos > xpos) {
           xpos += speed *1.0;
         }
         if(Posts.get(lookingForPost).xpos < xpos) {
           xpos -= speed * 1.0;
         }
         if(Posts.get(lookingForPost).ypos > ypos) {
           ypos += speed * 1.0;
         }
         if(Posts.get(lookingForPost).ypos < ypos) {
           ypos -= speed * 1.0;
         }
         
     }
    if (type == 3) {
      chase(P1);
      }
   }
}