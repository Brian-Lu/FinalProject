class Prisoner{
  int xpos;
  int ypos;
  int lives;
  Prisoner() {
    xpos = 25;
    ypos = 25;
    lives = 1;
  }
  Prisoner(int xcor, int ycor, int Lives) {
    xpos = xcor;
    ypos = ycor;
    lives = Lives;
  }
  void display() {
    ellipse(xpos, ypos, 20, 20);
  }
  void behavior(Player other) {
    if (Math.abs(other.xpos - xpos) <= 5 && Math.abs(other.ypos - ypos) <= 5) {
      print ("b");
      if(other.keys >= 1) {
        other.keys -= 1;
        other.lives += lives;
        print(other.lives);
      }
    }
  }
}