class Key{
  int xpos,ypos;
  Key(){
    xpos = 420;
    ypos = 420;
  }
  Key(int xcor, int ycor){
    xpos = xcor;
    ypos = ycor;
  }
  void display() {
    rect(xpos, ypos, 10, 15);
  }
}