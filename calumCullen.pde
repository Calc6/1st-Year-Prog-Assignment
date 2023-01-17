//NAME:Calum Cullen
//STUDENT ID:20102180


String gameCond;//game conditon

int x = 600;//ball location center of screen
int vertical = 400;//balls y cord also to go up and down in future code

int rectWidth =50;
int rectHeight =400;

int rectX1 =1100; // rectangle x and y this gives there location used for collision detection and also move the pole
int rectY1 =600; 

int rectX2 =1400;
int rectY2= 550;

int rectX3 =1700;
int rectY3 = 350;

int rectX4 =2000;
int rectY4 = 450; 

int cPos=0;//cloud postion


void setup() {
  size(1200,800);
  gameCond = "START";//will allow the player to enter in diffrent stages of the game
}

void draw() {
  if(gameCond == "START"){ //start menu (Click to play )
    startGame();
  }
    else if(gameCond == "PLAY"){ //play stage where the game is being played by the player
      playGame();
  }
    else if(gameCond == "DEAD"){ // the player has died which brind them to a death screen
      loseGame();
    }
}

void reset(){
  x = 600;
  vertical = 400;
  rectWidth =50;
  rectHeight =400;
  rectX1 =1100;
  rectY1 =600; 
  rectX2 =1400;
  rectY2= 550;
  rectX3 =1700;
  rectY3 = 350;
  rectX4 =2000;
  rectY4 = 450; 
  cPos=0;
}

void startGame(){
  background(255,120,0);
  fill(255,0,0);
  textAlign(CENTER);
  textSize(50);
  text("CLick TO Start",width/2 , height/4);
  if(mousePressed == true) {
   gameCond = "PLAY";  //once clicked the game will start
  }
 
  
}
void playGame(){// game mechanics 
  scene();
  fill(200,0,0);//red 
  ellipse(x,vertical,50,50);//circle
 
 if(mousePressed==true){
   vertical+=-10; //when mouse pressed ball will move up 
  }
  else vertical+=+3;//else ball is falling
  
  
  if(vertical < 0||vertical >800||x > rectX1 && x < rectX1 + rectWidth && vertical > 0 && vertical < 0 + rectHeight) 
  {
  gameCond ="DEAD";
  }
  else if(x > rectX1 && x < rectX1 + rectWidth && vertical > rectY1 && vertical < rectY1 + rectHeight)
{
  gameCond ="DEAD"; //Collision Dectection for the first bottom and top rectangles 
  
}
else if(x > rectX2 && x < rectX2 + rectWidth && vertical > 0 && vertical < 0 + rectHeight)
{
  gameCond ="DEAD";
}
else if(x > rectX2 && x < rectX2 + rectWidth && vertical > rectY2 && vertical < rectY2 + rectHeight)
{
  gameCond ="DEAD"; //Collision Dectection for the second bottom and top rectangles 
  
}
else if(x > rectX3 && x < rectX3 + rectWidth && vertical > 0 && vertical < 0 + rectHeight-200)
{
  gameCond ="DEAD";
}
else if(x > rectX3 && x < rectX3 + rectWidth && vertical > rectY3 && vertical < rectY3 + rectHeight+200)
{
  gameCond ="DEAD";//Collision Dectection for the third bottom and top rectangles 
  
}
else if(x > rectX4 && x < rectX4 + rectWidth && vertical > 0 && vertical < 0 + rectHeight-100)
{
  gameCond = "DEAD";
}
else if(x > rectX4 && x < rectX4 + rectWidth && vertical > rectY4 && vertical < rectY4 + rectHeight+200)
{
  gameCond = "DEAD";//Collision Dectection for the forth bottom and top rectangles 
  
}

  pole1();//First pole
if(rectX1 < -1){
    rectX1=+1250; //if the poles leaves the screen (-1) it will add 1250 length of the window so it will reappear from the right
  }
  
  pole2();//Second pole
if(rectX2 <-1){
    rectX2=+1250;
  }
  
  pole3();//Third pole
if(rectX3 <-1){
    rectX3=+1250;
  }
  
  pole4();//Forth pole
if(rectX4 < -1){
    rectX4=+1250;
  }
}

void loseGame(){
  background(0);
  fill(255,0,0);
  textAlign(CENTER);
  textSize(50);
  text("YOU DIED",width/2,height/4);
 text("CLICK TO PLAY AGAIN",width/2,width/2);
 if(mousePressed==true)
 {
   gameCond = "PLAY";
   reset();
 }
}

void pole1()
{
  fill(225,225,0);//first pole
  rect(rectX1,0,rectWidth,rectHeight);
  rect(rectX1,rectY1,rectWidth,rectHeight);
  rectX1-=3; //moving the pole
  
}

void pole2()
{
  fill(225,225,0);
  rect(rectX2,0,rectWidth,rectHeight);
  rect(rectX2,rectY2,rectWidth,rectHeight);
  rectX2-=3; 
}

void pole3()
{
  fill(225,225,0);
  rect(rectX3,0,rectWidth,rectHeight-200);
  rect(rectX3,rectY3,rectWidth,rectHeight+200);
  rectX3-=3;
}

void pole4()
{
  fill(225,225,0);
  rect(rectX4,0,rectWidth,rectHeight-100);
  rect(rectX4,rectY4,rectWidth,rectHeight+200);
  rectX4-=3;
}

void scene (){
  background(0,150,200);//sky
  
  fill(255);//cloud
  noStroke();
  ellipse(cPos+200,130,150,150);
  ellipse(cPos+100,160,90,90);
  ellipse(cPos+300,160,90,90);
  rect(cPos+100,165,200,40);
  
   cPos+= 4;//cloud moving right of the screen
if(cPos > width){
  cPos-=1500;//-1500 to push back the cloud to allow it ot come back on the screen
}
  
  fill(150,100,0);//brown
  rect(0,700,1200,100);//mud
  fill(0,200,0);//green
   int i = 700;
   while(i <=780)
   {
   rect(0,i,1200,10);//grass
   i+=20;//adds 20 pixels between every line
   }
  
  
  
}
