PImage backpic, floorpic, welcomescreen;
int game, score, highscore, x, y, vertical, floorx[] = new int[2], floory[] = new int[2];

void setup(){
backpic =loadImage("https://raw.githubusercontent.com/Gaspared/FlappyBird/main/img/back.png");
floorpic =loadImage("https://raw.githubusercontent.com/Gaspared/FlappyBird/main/img/wall.png");
welcomescreen =loadImage("https://raw.githubusercontent.com/Gaspared/FlappyBird/main/img/start.png");
game = 1; score = 0; highscore = 0; x = -200; vertical = 0;
  size(800,600);
  fill(0,0,0);
  textSize(20);
  
}

void draw(){
  if(game == 0){
    imageMode(CORNER);
    image(backpic, x, 0);  
    vertical +=1;
    y +=vertical;
    if(x==-1800) x = 0;
    for(int i =0; i<2; i++){
      imageMode(CENTER);
      image(floorpic, floorx[i], floory[i] - (floorpic.height/2+100));
      image(floorpic, floorx[i], floory[i] - (floorpic.height/2+100));
      if(floorx[i] < 0){
        floory[i] = (int)random(200,height-200);
        floorx[i] = width;
    }
    if(floorx[i] ==width/2) highscore = max(++score
}
}
