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
      image(imgK, xpos - 10, ypos - 15, 20, 30);
    }
  }

  
}