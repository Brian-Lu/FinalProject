int level;
int mode = 1;
int x = 100;
Player P1;
Guard g1;
ArrayList<Guard> Guards = new ArrayList<Guard>(1);
Wall w1;
ArrayList<Wall> Walls = new ArrayList<Wall>(1);
void setup(){
  size(1000, 650);
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
  if(mode == 1){
    Load(level);
    PlayLevel(level);
  }else if(mode == 2){
    ShowMenu(); 
  }else if(mode == 3){
    EditLevels(); 
  }
}
void PlayLevel(int level){
  background(204);
  DisplayEnd();
  P1.display();
  for(Guard guard : Guards){
    guard.display();
    if (guard.xpos == P1.xpos && guard.ypos == P1.ypos) {
      P1.lives -= 1;
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
  if (P1.lives == 0) {
      P1.speed = 0;
  }
  if(P1.xpos >= 800 && P1.xpos <= 815 && P1.ypos >= 600 && P1.ypos <= 615){
    level += 1;
    print(level);
  }
}

void Load(int level){
  int x  = level;
  
}
void ShowMenu(){
  
}
void EditLevels(){

}
void DisplayEnd(){
  fill(0,200,0);
  rect(800,600,15,15);
  fill(0);
}