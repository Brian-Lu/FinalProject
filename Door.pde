class Door extends Wall {
  boolean isOpen;
  Door(float xCor, float yCor, float wdth, float hght) {
    xpos = xCor;
    ypos = yCor;
    Width = wdth;
    Height = hght;
    isOpen = false;
  }
  Door() {
    this(580, 580, 50, 50);
  }
  void display() {
    if(isOpen == false) {
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
    
    