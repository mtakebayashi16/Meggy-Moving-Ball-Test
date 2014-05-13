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

void loop(){
  checkDirections();
  drawDot();
  checkBoundaries();

  DisplaySlate();
  delay(200);
  ClearSlate();
}                    //end main loop


void checkDirections(){
  if (directions = 0)          
    dotX ++;
  if (directions = 45){         
    dotX ++;
    dotY ++;
  }
  if (directions = 90)
    dotY ++;
  if (directions = 135){
    dotX --;
    dotY ++;
  }
  if (directions = 180)
    dotX --;
  if (directions = 225){
    dotX --;
    dotY --;
  }
  if (directions = 270)
    dotY --;
  if (directions = 315){
    dotX ++;
    dotY --;
  }
    
}

void drawDot(){
 DrawPx(dotX, dotY, Green); 
}

void checkBoundaries(){
  if (dotX == 0 && dotY == 0)   //if ball is in bottom left corner   
    directions = 45;           //if ball hits a corner, make it go oout diagonally
  if (dotX == 0 && dotY ==7)     //if ball is in the top left corner
    directions = 315;
  if (dotX == 7 && dotY == 0)    //if ball is in the bottom right corner
    directions = 135;
  if (dotX == 7 && dotY == 7)    //if ball is in the top right corner
    directions = 225;
    
  if (dotX > 7){              //for when the ball hits the right side
    if (directions = 0)
      directions = 225;    //if the ball is going directly right, it will go left/down
    if (directions = 45)
      directions = 135;     //if the ball is going right/up, it will go left/up
    if (directions = 315)
      directions = 225;     //if the ball is going right/down, it will go left/down
  }
  if (dotX <  0){             //for when the ball hits the left side
    if (directions = 225)
      directions = 315;    //if the ball is going left/down, it will go right/down
    if (directions = 135)
      directions = 45;    //if the ball is going left/up, it will go right/up
    if (directions = 180)
      directions = 315;    //if the ball is going left, it will go right/down
  }
  if (dotY > 7){            //for when the ball hits the top of the screen
    if (directions = 45)
      directions = 315;    //if the ball is going right/up, it will go right/down
    if (directions = 90)
      directions = 315;       //if the ball is going straight up, it will go right/down
    if (directions = 135)
      directions = 225;
  }
  if (dotY < 0){          //for when the ball hits the bottom of the screen
    if (directions = 225)
      directions = 135;        //if the ball is going left/down, it will go left/up
    if (directions = 270)
      directions = 45;          //if the ball is going straight down, it will go right/up
    if (directions = 315)
      directions = 135;        //if the ball is going right/down, it will go left/up
  }
  
} //end boundaries check


