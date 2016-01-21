class Endspot{
  int xpos,ypos,Width,Height;
  Endspot(){
    xpos = 800;
    ypos = 550;
    Width = 20;
    Height = 20;
  }
  Endspot(int Xpos,int Ypos,int wdt,int hgt){
     xpos = Xpos;
     ypos = Ypos;
     Width = wdt;
     Height = hgt;
  }
  void display(){
    fill(0,150,0);
    rect(xpos,ypos,Width,Height); 
  }
}