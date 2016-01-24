int level, mode, maxLevel;
int x = 100;
int next;
Player P1;
Endspot E1;
// ArrayLists temporarily hold each object types for each specific level
ArrayList<Guard> Guards = new ArrayList<Guard>(1);
ArrayList<Wall> Walls = new ArrayList<Wall>(1);
ArrayList<Prisoner> Prisoners = new ArrayList<Prisoner>(1);
ArrayList<Key> Keys = new ArrayList<Key>(1);
ArrayList<Door> Doors = new ArrayList<Door>(1);
void setup(){
  size(1000, 650);
  mode = 2;
}
void patrol(){
  if(Guards.size() >= 1){
    for(Guard guard : Guards){
      if (Math.sqrt(Math.pow((P1.xpos - guard.xpos),2) + Math.pow((P1.ypos - guard.ypos),2)) <= 100) {
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
    PlayLevel(level);
  }else if(mode == 2){
    ShowMenu(); 
  }else if(mode == 3){
    EditLevels(); 
  }
}
void PlayLevel(int level){
  background(204);
  E1.display();
  for(Key abc : Keys) {
    abc.display();
    if (Math.abs(P1.xpos - abc.xpos) <= 2 && Math.abs(P1.ypos - abc.ypos) <= 2) {
      P1.addKey();
    }
  }
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
      Load("level" + level + ".txt");
      P1.lives = 5;
      P1.xpos = 20;
      P1.ypos = 20;
      P1.speed = 2;
      
  }
  if(P1.xpos >= E1.xpos  && P1.xpos <= E1.xpos + E1.Width && P1.ypos >= E1.ypos && P1.ypos <= E1.ypos + E1.Height){
    next = level + 1;
    setLevel(next);
    String file = "level" + next + ".txt";
    Load(file);
  }
  for (Door door : Doors) {
    door.block(P1);
    door.display();
  }
  P1.display();
  P1.move();
}

void Load(String filename){
  Guards.clear();
  Walls.clear();
  Prisoners.clear();
  Keys.clear();
  int num;
  int[] nums = new int[20];
  String[] lines = loadStrings(filename);
  for(int x = 0;x<lines.length;x++){
    String[] words = split(lines[x]," ");
    /* Since words has all of the data in strings,
    we parse all the data into ints and save them in
    int[] nums.
    */
    for(int i = 1;i<words.length;i++){
      if(!(words[i]==null)){
        num = Integer.parseInt(words[i]);
        nums[i-1] = num;
      }
    }
    /* Words Format:
    {<Object Type>,<xpos>,<ypos>} for all objects
    -for walls, it is extended to add height and width
    -for guards, it will be extended as far as necessary to add patrol points
    */
    if(words[0].equals("Player")){
      P1 = new Player(nums[0],nums[1],1,100);
    }else if(words[0].equals("Guard")){
      Guards.add(new Guard(nums[0],nums[1],nums[2],100));
    }else if(words[0].equals("Wall")){
      Walls.add(new Wall(nums[0],nums[1],nums[2],nums[3]));
    }else if(words[0].equals("Prisoner")){
      Prisoners.add(new Prisoner(nums[0],nums[1],3));
    }else if(words[0].equals("Key")){
      Keys.add(new Key(nums[0],nums[1]));
    }else if(words[0].equals("Endspot")){
      E1 = new Endspot(nums[0],nums[1],nums[2],nums[3]); 
    }
  }
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
      Load("level" + level + ".txt");
    } 
  }
  if(mouseX >= 625 && mouseX <= 875 && mouseY >= 100 && mouseY <= 200){
    if(mousePressed){
      Load("clearLevel.txt");
      mode = 3;
    }
  }

}
void displayLevel(){
  background(204);
  for(Key k : Keys){
    k.display(); 
  }
  for(Wall wall : Walls){
    wall.display();
  }
  for(Guard guard : Guards){
    guard.display(); 
  }
  for(Prisoner prisoner : Prisoners){
    prisoner.display(); 
  }
  for(Door door : Doors){
    door.display(); 
  }
  if(P1 != null){
    P1.display();
  }
}
boolean Testing;
void EditLevels(){
  displayLevel();
  displaySidebar();
  if(Testing){
    test(); 
  }else{
    Edit();
  }
}
String selector = "";
int startXcor;
int startYcor;
int xcor = -1;
int ycor = -1;
void Edit(){
  if(mouseX>=900 && mouseY >= 0 && mouseY <= 50){
    if(mousePressed){
      selector = "Player";
    }
  }else if(mouseX>=900 && mouseY >= 50 && mouseY <= 100){
    if(mousePressed){
      selector = "Wall"; 
    }
  }else if(mouseX>=900 && mouseY >= 100 && mouseY <= 150){
    if(mousePressed){
      selector = "Guard";
    }
  }else if(mouseX>=900 && mouseY >= 150 && mouseY <= 200){
    if(mousePressed){
      selector = "Door";
    }
  }else if(mouseX>=900 && mouseY >= 200 && mouseY <= 250){
    if(mousePressed){
      selector = "Key";
    }
  }else if(mouseX>=900 && mouseY >= 250 && mouseY <= 300){
    if(mousePressed){
      selector = "EndSpot";
    }
  }else if(mouseX>=900 && mouseY >= 300 && mouseY <= 350){
    if(mousePressed){

    }
  }else if(mouseX>=900 && mouseY >= 350 && mouseY <= 400){
    if(mousePressed){
      Testing = true;
    }
  }else if(mouseX>=900 && mouseY >= 350 && mouseY <= 400){
    if(mousePressed){
      
    }
  }else if(mouseX>=900 && mouseY >= 450 && mouseY <= 500){
    if(mousePressed){
      selector = "";
      mode = 2;
    }
  }
  print(selector);
  if(mouseX <= 900 && mouseX >= 0){
    if(selector == "Wall"){
      if(mousePressed){
        xcor = mouseX;
        ycor = mouseY;
      }
      if(xcor != -1 && ycor != -1){
        fill(200,0,0);
        rect(xcor,ycor,mouseX - xcor,mouseY-ycor);
      }
      if(keyPressed && key == 'a'){
        if(xcor == -1 || ycor == -1){
            
        }else{
          Walls.add(new Wall(xcor,ycor,mouseX - xcor,mouseY - ycor));
          selector = "";
          xcor = -1;
          ycor = -1;
        }
      }
    }else if(selector == "Guard"){
      if(mousePressed){
        Guards.add(new Guard(mouseX,mouseY,1,100));
      }
    }else if(selector == "Player"){
      if(mousePressed){
        P1 = new Player(mouseX,mouseY,1,100);
        startXcor = mouseX;
        startYcor = mouseY;
      }
    }else if(selector == "Door"){
      if(mousePressed){
        xcor = mouseX;
        ycor = mouseY;
      }
      if(xcor != -1 && ycor != -1){
        fill(200,0,200);
        rect(xcor,ycor,mouseX - xcor,mouseY-ycor);
      }
      if(keyPressed && key == 'a'){
        if(xcor == -1 || ycor == -1){
            
        }else{
          Doors.add(new Door(xcor,ycor,mouseX - xcor,mouseY - ycor));
          selector = "";
          xcor = -1;
          ycor = -1;
        }
      }
    }else if(selector == "Key"){
      if(mousePressed){
        Keys.add(new Key(mouseX,mouseY));
      }
    }else if(selector == "EndSpot"){
      if(mousePressed){
        E1 = new Endspot(mouseX,mouseY,20,20);
      }
    }
  }
}
void test(){
  background(204);
  for(Key abc : Keys) {
    if (Math.abs(P1.xpos - abc.xpos) <= 2 && Math.abs(P1.ypos - abc.ypos) <= 2) {
      P1.addKey();
    }
  }
  for(Guard guard : Guards){
    if (guard.xpos == P1.xpos && guard.ypos == P1.ypos) {
      P1.lives -= 1;
    }
  }
  for(Prisoner prisoner : Prisoners) {
    prisoner.behavior(P1);
  }
  for(Wall wall : Walls) {
    for(Guard guard : Guards){
      wall.block(guard);
    }
    wall.block(P1);
  }
  patrol();
  if (P1.lives <= 0) {
      P1.speed = 0;
      mode = 2;
      Load("level" + level + ".txt");
      P1.lives = 5;
      P1.xpos = 20;
      P1.ypos = 20;
      P1.speed = 2;
      
  }
  if(P1.xpos >= E1.xpos  && P1.xpos <= E1.xpos + E1.Width && P1.ypos >= E1.ypos && P1.ypos <= E1.ypos + E1.Height){
    for(Guard guard : Guards){
      guard.xpos = guard.Posts[0][0];
      guard.ypos = guard.Posts[0][1];
    }
    for(Prisoner p : Prisoners){
      p.lives = 1; 
    }
    for(Key k : Keys){
      k.used = false;
    }
    for(Door door : Doors){
      door.isOpen = false; 
    }
    Testing = false;
  }
  for (Door door : Doors) {
    door.block(P1);
  }
}
PrintWriter output;
void save(String name){
  if(P1 == null || E1 == null){
    
  }else{
    output = createWriter("level" + name + ".txt");
    output.println("Player "+startXcor+" "+ startYcor);
    for(Wall wall : Walls){
      output.println("Wall "+wall.xpos+" "+wall.ypos+" "+wall.Width+" "+wall.Height);
    }
    for(Guard guard : Guards){
      output.println("Guard "+guard.xpos+" "+guard.ypos);
    }
    for(Door door : Doors){
      output.println("Door "+door.xpos+" "+door.ypos+" "+door.Width+" "+door.Height);
    }
    for(Key k : Keys){
      output.println("Key " +k.xpos+" "+k.ypos);
    }
  }
}
void setLevel(int Level){
  level = Level;
}
void displaySidebar(){
  fill(255);
  rect(900,0,100,50);
  rect(900,50,100,50);
  rect(900,100,100,50);
  rect(900,150,100,50);
  rect(900,200,100,50);
  rect(900,250,100,50);
  rect(900,300,100,50);
  rect(900,350,100,50);
  rect(900,400,100,50);
  rect(900,450,100,50);
  fill(0);
  PFont sidebar = createFont("Times New Roman",10, true);
  textAlign(CENTER);
  textFont(sidebar,10);
  text("Player",950,25);
  text("Wall",950,75);
  text("Guard",950,125);
  text("Door",950,175);
  text("Key",950,225);
  text("End Zone",950,275);
  text("Undo",950,325);
  if(Testing){
    text("Reset",950,375);
  }else{
    text("Test",950,375);
  }
  text("Save",950,425);
  text("Back",950,475);
}