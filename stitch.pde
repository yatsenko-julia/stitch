int y = 650;
float[][] coord;
float[][] coord2;
int score = 0;
int speed = 5;
int speed2 = 4;
int ballsCount = 3;
int bad = 1;
PImage[] image = new PImage[4];
int sizeI = 80;
int sizeB1 = 90;
int sizeB2 = 120;


void setup(){
  size(800,800);
  smooth();
  coord = new float[ballsCount+1][3];
  coord2  = new float[bad + 1][3];
  
  coord[1][1] =  random(sizeI, width-sizeI);
  coord[1][2] = 0;
  for(int j = 2; j <= ballsCount; j++){
    coord[j][1] =  random(sizeI, width-sizeI);
    coord[j][2] = -1 * random(0,300);
  }
  coord2[1][1] =  random(sizeI, width-sizeI);
  coord2[1][2] = 0;
  
  image[0] = loadImage("icecream.png");
  image[1] = loadImage("stitch.png");
  image[2] = loadImage("back.png");
  image[3] = loadImage("u.png");
}
void draw(){
  background(image[2]);
  text("SCORE "+score,10,10);
  
  for(int i = 1; i <= ballsCount; i++){
     image(image[0],coord[i][1], coord[i][2], sizeI, sizeI);
     coord[i][2] = coord[i][2] + speed;
     if(coord[i][2] > height - 80){
        coord[i][2] = 0;
        float r2 = random(sizeI, width - sizeI);
        coord[i][1] = r2;
      }
     if(coord[i][2]+70 >= y){
       if (abs(mouseX - (coord[i][1] + sizeI/2)) <= sizeI/2+75 - 25) {
         coord[i][2] = 0;
         score ++;
         float r2 = random(sizeI, width - sizeI);
         coord[i][1] = r2;
       }
     }
  }
  
  for(int k = 1; k <= bad; k++){
      image(image[3],coord2[k][1], coord2[k][2], sizeB1, sizeB2);
      coord2[k][2] = coord2[k][2] + speed2;
      if(coord2[k][2] > height - 80){
        coord2[k][2] = 0;
        float r2 = random(sizeB1, width - sizeB2);
        coord2[k][1] = r2;
      }
      if(coord2[k][2]+70 >= y){
       if (abs(mouseX - (coord2[k][1] + sizeB1/2)) <= sizeB1/2+75 - 25) {
         coord2[k][2] = 0;
         float r2 = random(sizeB1, width - sizeB2);
         coord2[k][1] = r2;
         score = -1;
       }
     }
  }
  
  if(score < 0){
    textSize(70);
    text("Game over", 250, 400);
    noLoop();
  }
  
  if(score >= 20){
    textSize(70);
    text("You win!", 250, 400);
    noLoop();
  }
  image(image[1],mouseX-75, y, 150, 150);
}

void mousePressed() {
  textSize(10);
  if(score < 0 || score >= 20){
    loop();
    score = 0;
    coord[1][1] =  random(sizeI, width-sizeI);
    coord[1][2] = 0;
    for(int j = 2; j <= ballsCount; j++){
      coord[j][1] =  random(sizeI, width-sizeI);
      coord[j][2] = -1 * random(0,300);
    }
  }
}