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
  void block(Player other) {
    if (isOpen == false) {
      if (other.keys >= 1) {
        isOpen = true;
        other.keys -= 1;
      }
      else {
        super.block(other);
      }
    }
  }
}
    
    