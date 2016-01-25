int level, mode, maxLevel;
int x = 100;
int next;
PImage imgP;
PImage imgG;
PImage imgR;
PImage imgK;
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
  imgP = loadImage("Prisoner.png");
  imgG = loadImage("Guard.png");
  imgR = loadImage("Captured.png");
  imgK = loadImage("Key.png");
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
    if(selector == "Save"){
      SaveScreen();
    }else{
      EditLevels();
    }
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
Guard g1;
void Load(String filename){
  Guards.clear();
  Walls.clear();
  Prisoners.clear();
  Keys.clear();
  Doors.clear();
  P1 = null;
  E1 = null;
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
      P1 = new Player(nums[0],nums[1],1.5,100);
    }else if(words[0].equals("Guard")){
      g1 = new Guard(nums[0],nums[1],1,100,nums[2]);
      int n = 3;
      while(nums[n]!=0 && nums[n+1]!=0){
        g1.Posts.add(new Post(nums[n],nums[n+1]));
        print(g1.Posts.get(g1.Posts.size()-1).xpos);
        n += 2;
      }
      Guards.add(g1);
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
  if(E1 != null){
    E1.display();
  }
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
ArrayList<String> LastSelector = new ArrayList<String>(1);
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
      selector = "Prisoner";
    }
  }else if(mouseX>=900 && mouseY >= 300 && mouseY <= 350){
    if(mousePressed){
      selector = "Endspot";
    }
  }else if(mouseX>=900 && mouseY >= 350 && mouseY <= 400){
    if(mousePressed){
      selector = "Undo";
    }
  }else if(mouseX>=900 && mouseY >= 400 && mouseY <= 450){
    if(mousePressed){
      Testing = true;
    }
  }else if(mouseX>=900 && mouseY >= 450 && mouseY <= 500){
    if(mousePressed){
      /*LevName = "";
      selector = "Save";
      Ready = true;*/
    }
  }else if(mouseX>=900 && mouseY >= 500 && mouseY <= 550){
    if(mousePressed){
      selector = "";
      mode = 2;
    }
  }
  
  
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
      if(keyPressed){
        if(xcor == -1 || ycor == -1){
        /* Makes sure x and y cor are valid inputs */             
        }else{
          Walls.add(new Wall(xcor,ycor,mouseX - xcor,mouseY - ycor));
          selector = "";
          LastSelector.add("Wall");
          xcor = -1;
          ycor = -1;
        }
      }
    }else if(selector == "Guard"){
      if(mousePressed){
        Guards.add(new Guard(mouseX,mouseY,1,100));
        selector = "";
        LastSelector.add("Guard");
      }
    }else if(selector == "Player"){
      if(mousePressed){
        P1 = new Player(mouseX,mouseY,1,100,mouseX,mouseY);
        startXcor = mouseX;
        startYcor = mouseY;
        LastSelector.add("Player");
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
      if(keyPressed){
        if(xcor == -1 || ycor == -1){
            
        }else{
          Doors.add(new Door(xcor,ycor,mouseX - xcor,mouseY - ycor));
          selector = "";
          LastSelector.add("Door");
          xcor = -1;
          ycor = -1;
        }
      }
    }else if(selector == "Key"){
      if(mousePressed){
        Keys.add(new Key(mouseX,mouseY));
        selector = "";
        LastSelector.add("Key");
      }
    }else if(selector == "Prisoner"){
      if(mousePressed){
        Prisoners.add(new Prisoner(mouseX,mouseY,5));
        selector = "";
        LastSelector.add("Prisoner");
      }
    }else if(selector == "Endspot"){
      if(mousePressed){
        E1 = new Endspot(mouseX,mouseY,20,20);
        selector = "";
        LastSelector.add("Endspot");
      }
    }
  }else if(selector == "Undo"){
    if(mousePressed){
      Undo();
      selector = "";
    }
  }
}
void Undo(){
  if(!LastSelector.isEmpty()){
    try{
      if(LastSelector.get(LastSelector.size()-1) == "Wall"){
        if(Walls.size() >= 1){
          Walls.remove(Walls.size()-1);
          if(LastSelector.size() >= 1){
            LastSelector.remove(LastSelector.size()-1);
          }  
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Door"){
        if(Doors.size() >= 1){
          Doors.remove(Doors.size()-1);
          if(LastSelector.size() >= 1){
            LastSelector.remove(LastSelector.size()-1);
          }  
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Player"){
        P1 = null;
        if(LastSelector.size() >= 1){
          LastSelector.remove(LastSelector.size()-1);
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Guard"){
        if(Guards.size() >= 1){
          Guards.remove(Guards.size()-1);
          if(LastSelector.size() >= 1){
            LastSelector.remove(LastSelector.size()-1);
          }
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Key"){
        if(Keys.size() >= 1){
          Keys.remove(Keys.size()-1);
          if(LastSelector.size() >= 1){
            LastSelector.remove(LastSelector.size()-1);
          }    
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Endspot"){
        E1 = null;
        if(LastSelector.size() >= 1){
          LastSelector.remove(LastSelector.size()-1);
        }
      }
      if(LastSelector.get(LastSelector.size()-1) == "Prisoner"){
        if(Prisoners.size() >= 1){
          Prisoners.remove(Prisoners.size()-1);
          if(LastSelector.size() >= 1){
            LastSelector.remove(LastSelector.size()-1);
          }
        }
      }
    }catch(IndexOutOfBoundsException e){
      //Stops the user from trying to undo nothing
    }
  }
}
void EditReset(){
 P1.editReset();
 for(Guard guard : Guards){
   guard.xpos = guard.Posts.get(0).xpos;
   guard.ypos = guard.Posts.get(0).ypos;
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
//int Color = 0;
void test(){
  if(P1== null || E1 == null){
    /*while(Color <= 204){
      notice = createFont("Times New Roman",20);
      textFont(notice);
      textAlign(CENTER);
      Color += 1;
      fill(Color); 
      text("Please add a player AND an endspot",500,325);
    }*/
  }else{
    P1.move();
    for(Key abc : Keys) {
      if (Math.abs(P1.xpos - abc.xpos) <= 2 && Math.abs(P1.ypos - abc.ypos) <= 2) {
        P1.addKey();
      }
    }
    for(Guard guard : Guards){
      if (Math.abs(guard.xpos - P1.xpos) <= 2 && Math.abs(guard.ypos - P1.ypos) <= 2) {
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
        EditReset();
    }
    if(P1.xpos >= E1.xpos  && P1.xpos <= E1.xpos + E1.Width && P1.ypos >= E1.ypos && P1.ypos <= E1.ypos + E1.Height){
      EditReset();
    }
    for (Door door : Doors) {
      door.block(P1);
    }
    if (mouseX>=900 && mouseY>=350 && mouseY <= 400){
      if(mousePressed){
        EditReset();
      }
    }
  }
}
PFont notice;
PrintWriter output;
void save(String name){
  if(P1 == null || E1 == null){
    print("Missing a player or endSpot"); 
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
String LevName;
boolean Ready;
void SaveScreen(){
  background(204);
  text("NAME YOUR LEVEL",500,100);
  fill(255);
  rect(800,500,100,50);
  rect(400,300,200,50);
  fill(0);
  text("SAVE",850,525);
  text(LevName,500,325);
  if(keyPressed){
    if(Ready){
      LevName += key + ""; 
      Ready = false;
    }else if(key == ENTER){
      Ready = true;
    }
  }
  print(LevName);
  if(mouseX>=800&&mouseX<=900&&mouseY>=500&&mouseY<=600){
    if(mousePressed){
      if(LevName.equals("")){
             
      }else{
        //save(LevName); 
        selector = "";
      }
    }
  }
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
  rect(900,500,100,50);
  rect(900,550,100,50);
  rect(900,600,100,50);
  fill(0);
  PFont sidebar = createFont("Times New Roman",10, true);
  textAlign(CENTER);
  textFont(sidebar,10);
  text("Player",950,25);
  text("Wall",950,75);
  text("Guard",950,125);
  text("Door",950,175);
  text("Key",950,225);
  text("Prisoner",950,275);
  text("End Zone",950,325);
  text("Undo",950,375);
  if(Testing){
    text("Reset",950,425);
  }else{
    text("Test",950,425);
  }
  text("Save",950,475);
  text("Back",950,525);
}