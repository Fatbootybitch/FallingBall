PImage backpic, ballpic, netpic, welcomescreen;
int game, score, highscore, x, y, horizontal, netx[] = new int[2], nety[] =new int[2];
void setup() {
   backpic =loadImage("https://raw.githubusercontent.com/Fatbootybitch/FallingBall/main/E399E9DB-00A0-47F8-BA74-AAA29C14E297.png");
   ballpic =loadImage("https://raw.githubusercontent.com/FatBootyBitch/FallingBall/main/vbal2.png");
   netpic =loadImage("https://raw.githubusercontent.com/FatBootyBitch/FallingBall/main/stripebar.png");
   welcomescreen=loadImage("https://raw.githubusercontent.com/FatBootyBitch/FallingBall/main/BA4ADE91-0596-446C-B4D7-A5600676A84C.png");
   game = 1; score = 0; highscore = 0; x = -200; horizontal = 0; 
  size(600,800);
  fill(0,0,0);
  textSize(20);  
}
void draw() { 
  if(game == 0) {
    imageMode(CORNER);
    image(backpic, x, 0);
    horizontal += 1;
    y += horizontal;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(netpic, netx[i], nety[i] - (netpic.height/2+100));
      image(netpic, netx[i], nety[i] + (netpic.height/2+100));
      if(netx[i] < 0) {
        nety[i] = (int)random(200,height-200);
        netx[i] = width;
      }
      if(netx[i] == width/2) highscore = max(++score, highscore);
      if(y>height||y<0||(abs(width/2-netx[i])<25 && abs(y-nety[i])>100)) game=1;
      netx[i] -= 6;
    }
    image(ballpic, width/2, y);
    text("Score: "+score, 10, 20);
  }
  else {
    imageMode(CENTER);
    image(welcomescreen, width/2,height/2);
    text("High Score: "+highscore, 50, 130);
  }
}
void mousePressed() {
  horizontal = -15;
  if(game==1) {
    netx[0] = 600;
    nety[0] = y = height/2;
    netx[1] = 900;
    nety[1] = 600;
    x = game = score = 0;
  }
}
