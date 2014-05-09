/*
0 = right
45 = right/up
90 = up
135 = left/up
180 = left
225 = left/down
270 = down
315 = right/down
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
  if (dotX == 0 && dotY ==7     //if ball is in the top left corner
    directions = 315;
  if (dotX == 7 && dotY == 0)    //if ball is in the bottom right corner
    directions = 135;
  if (dot X == 7 && dotY == 7)    //if ball is in the top right corner
    directions = 225;
    
  if (dotX > 7)
    
  
}

