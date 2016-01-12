int x = 100;
Player P1;
Guard g1;
ArrayList<Guard> Guards = new ArrayList<Guard>(1);
Wall w1;
ArrayList<Wall> Walls = new ArrayList<Wall>(1);
void setup(){
  size(1000, 1000);
  P1 = new Player(20.0,20.0,2,100);
  Guards.add(new Guard(80.0,80.0,1,100));
  Wall w1 = new Wall(500,500,50,50);
  Walls.add(w1);
}
void patrol(){
  if(Guards.size() >= 1){
    for(Guard guard : Guards){
      if (P1.xpos - guard.xpos <= 100){
        guard.alert = true;
        guard.chase(P1);
      }
    }
  }
}
void draw(){
  background(204);
  P1.display();
  for(Guard guard : Guards){
    guard.display();
    if (guard.xpos == P1.xpos && guard.ypos == P1.ypos) {
      print("a");
    }
  }
  for(Wall wall : Walls) {
    for(Guard guard : Guards){
      wall.block(guard);
    }
    wall.block(P1);
    wall.display();
  }
  P1.move();
  patrol();
  
}

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
    rect(xpos,ypos,Width,Height);
    fill(100,0,0);
  }
}
