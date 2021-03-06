private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5; 
public int branches = 0; 
public void setup() 
{   
  size(800,500);    
 // noLoop(); 
} 
public void draw() 
{ 
  if (keyPressed== true && keyCode == UP ){
	branches = branches + 10;
  }
  if (keyPressed== true && keyCode == DOWN ){
	branches = branches - 10;
  }
  if(branches > 110){
 	branches = 110;
  }
  if(branches < 0){
 	branches = 0;
  }

  background(255);   
  stroke(#70C6AF);   
  strokeWeight(2);
  line(400,500,400,400);   
  drawBranches(400,400, branches ,3*Math.PI/2);  //will add later 

} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1= angle + branchAngle;
  double angle2= angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(2);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
