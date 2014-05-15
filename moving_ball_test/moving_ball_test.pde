/*
0 = right
45 = right/up
90 = up
135 = left/up
180 = left
225 = left/down
270 = down
315 = right/down

x will only be greater than 7 when it hits the right side, the directions that could make this happen are:
		0 (right), 45 (right up), 315 (right/down)

x will only be less than 0 when it hits the left side, the directions that could make this happen are:
		135 (left/up), 180 (left), 225 (left/down)

make corners the exception to the rule, the ball should bounce back the way it came

y will only be greater than 7 when it hits the top side, the directions that could make this happen are:
		45 (right/up), 90 (up), 135 (left/up)

y will only be less than 0 when it hits the bottom side, the directions that could make this happen are:
		225 (left/down), 270 (down), 315 (right/down)
*/

#include <MeggyJrSimple.h>     //Required code line 1 of 2

void setup(){
  MeggyJrSimpleSetup();        //Required code line 2 of 2
}

int dotX = 0;
int dotY = 4;
int directions = 315;
int platformX = 0;
int counter = 0;
boolean gameOver = false;

void loop(){
  counter ++;
  if (counter > 1000)
    counter = 1;
  drawPlatform();
  movePlatform();
  checkBoundaries();
  drawDot();
  checkBall();
  
  if (gameOver){
    gameRestart();          //starts sequence to restart game
    ClearSlate();
    delay(2000); 
  }
  
  if (counter % 500 == 0)
    checkDirections();

  DisplaySlate();
  ClearSlate();

}                    //end main loop

void drawPlatform(){
  DrawPx(platformX, 0, Yellow);
  DrawPx (platformX+1, 0, Yellow);
  DrawPx(platformX+2, 0, Yellow);
}

void movePlatform(){
 
  CheckButtonsDown();
  if (counter % 300 == 0){
    if (Button_Right)
      platformX ++;
    if (Button_Left)
      platformX --;
    
    if (platformX < 0)
      platformX = 0;
   
     if (platformX+2 > 7)
       platformX = 5;
  }
}

void checkDirections(){
  if (directions == 0)          
    dotX ++;
  if (directions == 45){         
    dotX ++;
    dotY ++;
  }
  if (directions == 90)
    dotY ++;
  if (directions == 135){
    dotX --;
    dotY ++;
  }
  if (directions == 180)
    dotX --;
  if (directions == 225){
    dotX --;
    dotY --;
  }
  if (directions == 270)
    dotY --;
  if (directions == 315){
    dotX ++;
    dotY --;
  }
    
}

void drawDot(){
 DrawPx(dotX, dotY, Blue); 
}

void checkBoundaries(){ 
  if (dotX == 0 && dotY == 0){   //if ball is in bottom left corner   
    int j = random(1,3);        //random sequence to determine which way the ball bounces
    if (j == 1)
      directions = 45;       //if ball hits a corner, make it go oout diagonally
    if (j == 2)
      directions = 90;
    dotX = 0;
    dotY = 0;
  }
  if (dotX == 0 && dotY ==7){     //if ball is in the top left corner
    int j = random(1,3);        //random sequence to determine which way the ball bounces
    if (j == 1)
      directions = 315;       //if ball hits a corner, make it go oout diagonally
    if (j == 2)
      directions = 270;
    dotX = 0;
    dotY = 7;
  }
  if (dotX == 7 && dotY == 0){    //if ball is in the bottom right corner
    int j = random(1,3);        //random sequence to determine which way the ball bounces
    if (j == 1)
      directions = 90;       //if ball hits a corner, make it go oout diagonally
    if (j == 2)
      directions = 135;
    dotX = 7;
    dotY = 0;
  }
  if (dotX == 7 && dotY == 7){    //if ball is in the top right corner
    int j = random(1,3);        //random sequence to determine which way the ball bounces
    if (j == 1)
      directions = 270;       //if ball hits a corner, make it go oout diagonally
    if (j == 2)
      directions = 225;
    dotX = 7;
    dotY = 7;
  }
    
  int x = random(1,3); //creates a random number, either 1, 2, or 3. Used for when the ball hits a wall straight on, it will bounce in one of two possible directions
    
  if (dotX > 7){              //for when the ball hits the right side
    dotX = 7;
    if (directions = 0){      //if the ball is going directly right...
      if (x == 1)
        directions = 225;      //half the time the ball will go left/down
      if (x == 2)
        directions = 135;      //half the time the ball will go left/up
    }
    if (directions = 45)
      directions = 135;     //if the ball is going right/up, it will go left/up
    if (directions = 315)
      directions = 225;     //if the ball is going right/down, it will go left/down
  }
  if (dotX <  0){             //for when the ball hits the left side
    dotX = 0;
    if (directions = 225)
      directions = 315;    //if the ball is going left/down, it will go right/down
    if (directions = 135)
      directions = 45;    //if the ball is going left/up, it will go right/up
    if (directions = 180){    //if the ball is going left
      if (x == 1)
        directions = 315;   //half the time the ball will go right/down
      if (x == 2)
         directions = 45;
    }
  }
  if (dotY > 7){            //for when the ball hits the top of the screen
    dotY = 7;
    if (directions = 45)
      directions = 315;    //if the ball is going right/up, it will go right/down
    if (directions = 90){      //if the ball is going straight up...
      if (x == 1)
        directions = 315;       //half the time the ball will go right/down    
      if (x == 2)
        directions = 225;        //half the time the ball will go left/down
    }
    if (directions = 135)
      directions = 225;
  }
  if (dotY < 0){          //for when the ball hits the bottom of the screen
    dotY = 0;
   if (directions = 225)
     directions = 135;        //if the ball is going left/down, it will go left/up 
    if (directions = 270)
      directions = 45;          //if the ball is going straight down, it will go right/up
    if (directions = 315)
      directions = 45;        //if the ball is going right/down, it will go left/up
   //   gameOver = true;
   }
  
} //end boundaries check


void gameRestart(){
  dotX = 0;
  dotY = 4;
  directions = 315;
  platformX = 0;
  counter = 0;
  gameOver = false;
}

void checkBall(){
  int x = random(1,3); //creates a random number, either 1, 2, or 3. Used for when the ball hits a wall straight on, it will bounce in one of two possible directions
  if (ReadPx(dotX,dotY) == Green){      //checks if the ball has hit the platform
    dotY = 1;
    int i = random(1,11);  //this line and the one below make the ball bounces in the "opposite" direction 8 of 10 times
    if (i <= 8){       // otherwise the ball will bounce up
      if (directions == 225)          //if the ball is going down/left, the ball will go left/up
        directions = 135;
      if (directions == 270){  //if the ball is going directly down it will either bounce right/up or left/up
        if (x == 1)
          directions = 135;
        if (x == 2)
          directions = 45;
      }
       if (directions == 315)
         directions = 45;
    }
    else{                  //2 of 10 times the ball will bounce straight up
      directions = 90;
    }
  }
   
}
