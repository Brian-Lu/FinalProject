class Prisoner{
  int xpos;
  int ypos;
  int lives;
  Prisoner() {
    xpos = 250;
    ypos = 250;
    lives = 1;
  }
  Prisoner(int xcor, int ycor, int Lives) {
    xpos = xcor;
    ypos = ycor;
    lives = Lives;
  }
}