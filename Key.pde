class Key{
  boolean used;
  int xpos,ypos;
  Key(){
    xpos = 420;
    ypos = 420;
  }
  Key(int xcor, int ycor){
    xpos = xcor;
    ypos = ycor;
  }
  void pickUp(){
    used = true;
  }

  void display() {
    if(!used){
      fill(255,204,0);
      rect(xpos, ypos, 10, 15);
    }
  }

  
}