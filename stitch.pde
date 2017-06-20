int y = 700;
int i = 0;
float r = random(0, 800);
void setup(){
  size(800,800);
  frameRate(1000);
  smooth();
}

void draw(){
  background(0);
  fill(#ffff99);

  ellipse(r, i, 20, 20);
  i++;
  
  rect(mouseX, y, 50, 50);
  
  
}