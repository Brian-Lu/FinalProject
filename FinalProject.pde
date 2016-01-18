int level;
int mode;
int x = 100;
Player P1;
Guard g1;
Guard g2;
Prisoner PR1;
Wall w1;
ArrayList<Guard> Guards = new ArrayList<Guard>(2);
ArrayList<Wall> Walls = new ArrayList<Wall>(1);
ArrayList<Prisoner> Prisoners = new ArrayList<Prisoner>(1);
void setup(){
  size(1000, 650);
  P1 = new Player(20.0,20.0,2,100);
  mode = 2;
  Guards.add(new Guard(80.0,80.0,1,100));
  Guards.add(new Guard(400.0, 400.0, 1, 100));
  Wall w1 = new Wall(500,500,50,50);
  Walls.add(w1);
  PR1 = new Prisoner(560, 560, 1);
  Prisoners.add(PR1);
}
void patrol(){
  if(Guards.size() >= 1){
    for(Guard guard : Guards){
      if (Math.sqrt(Math.pow((P1.xpos - guard.xpos),2) + Math.pow((P1.ypos - guard.ypos),2)) <= 100) {
        guard.alert = true;
        guard.chase(P1);
      }
      else {
        guard.move();
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
  for(Prisoner prisoner : Prisoners) {
    prisoner.display();
    prisoner.behavior(P1);
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
  if (P1.lives <= 0) {
      P1.speed = 0;
      mode = 2;
      Load(level);
      P1.lives = 5;
      P1.xpos = 20;
      P1.ypos = 20;
      P1.speed = 2;
      
  }
  if(P1.xpos >= 800 && P1.xpos <= 815 && P1.ypos >= 600 && P1.ypos <= 615){
    level += 1;
    print(level);
  }
}

void Load(int level){
  int x  = level;
/*  String s = "level" + level + ".txt";
  loadStrings(s);
  */
}

void ShowMenu(){
  fill(200,200,0);
  PFont title = createFont("Times New Roman", 30, true);
  background(0);
  textAlign(CENTER);
  textFont(title,50);
  text("Prison Escape", 500,50);
  
  fill(0,200,200);
  PFont choices = createFont("Times New Roman", 30, true);
  textFont(choices,30);
  text("Play Campaign",250,150);
  
  
  text("Level Editor",750,150);
  
  if(mouseX >= 100 && mouseX <= 400 && mouseY >= 100 && mouseY <= 200){
    if(mousePressed){
      mode = 1;
    } 
  }

}
void EditLevels(){

}
void DisplayEnd(){
  fill(0,200,0);
  rect(800,600,15,15);
}