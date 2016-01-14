class Wall{
  float xpos;
  float ypos;
  float Width;
  float Height;
  Wall(float Xpos,float Ypos,float wid,float hgt){
    xpos = Xpos;
    ypos = Ypos;
    Width = wid;
    Height = hgt;
  }
  Wall() {
    this(100.0, 100.0, 10, 50);
  }
  void block(Player Other){
     if(Math.abs(Other.xpos - xpos) <= 5 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
        Other.xpos = xpos - 5;
     }else if(Math.abs(Other.ypos - ypos) <= 5 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
        Other.ypos = ypos - 5;
     }else if(Math.abs(Other.xpos - (xpos + Width)) <= 5 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
        Other.xpos = xpos + Width + 5;
     }else if(Math.abs(Other.ypos - (ypos + Height)) <= 5 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
        Other.ypos = ypos + Height + 5;
     }
  }
  void block(Guard Other){
     if(Math.abs(Other.xpos - xpos) <= 5 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
        Other.xpos = xpos - 5;
     }else if(Math.abs(Other.ypos - ypos) <= 5 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
        Other.ypos = ypos - 5;
     }else if(Math.abs(Other.xpos - (xpos + Width)) <= 5 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
        Other.xpos = xpos + Width + 5;
     }else if(Math.abs(Other.ypos - (ypos + Height)) <= 5 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
        Other.ypos = ypos + Height + 5;
     }
  }
  void display(){
    fill(100,0,0);
    rect(xpos,ypos,Width,Height);
  }
}