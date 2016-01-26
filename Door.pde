class Door extends Wall {
  boolean isOpen;
  Door(float xCor, float yCor, float wdth, float hght) {
    super(xCor,yCor,wdth,hght);
    isOpen = false;
  }
  Door() {
    this(200, 200, 50, 50);
  }
  void display() {
    if(isOpen == false) {
      fill(150,0,150);
      rect(xpos, ypos, Width, Height);
    }
  }
  void block(Player Other) {
    if (isOpen == false) {
      if (Other.hasKEY()) {
        if(Math.abs(Other.xpos - xpos) <= 7 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
         isOpen = true;
         Other.keys -= 1;
        }else if(Math.abs(Other.ypos - ypos) <= 7 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
         isOpen = true;
         Other.keys -= 1;
        }else if(Math.abs(Other.xpos - (xpos + Width)) <= 7 && ypos <= Other.ypos && Other.ypos <= ypos + Height){
         isOpen = true;
         Other.keys -= 1;
        }else if(Math.abs(Other.ypos - (ypos + Height)) <= 7 && xpos <= Other.xpos && Other.xpos <= xpos + Width){
         isOpen = true;
         Other.keys -= 1;
        }
      }else{
        super.block(Other);
      }
    }
  }
}  
    