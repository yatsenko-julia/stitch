int y = 650;
float[][] coord;
int score = 0;
int speed = 5;
int ballsCount = 3;
PImage[] image = new PImage[3];
int sizeI = 80;


void setup(){
  size(800,800);
  smooth();
  coord = new float[ballsCount+1][3];
  
  coord[1][1] =  random(sizeI, width-sizeI);
  coord[1][2] = 0;
  for(int j = 2; j <= ballsCount; j++){
    coord[j][1] =  random(sizeI, width-sizeI);
    coord[j][2] = -1 * random(0,200);
  }
  image[0] = loadImage("icecream.png");
  image[1] = loadImage("stitch.png");
  image[2] = loadImage("back.png");
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
        score -= 1;
      }
     if(coord[i][2]+70 >= y){
       if (abs(mouseX+25 - coord[i][1]) <= 35) {
         coord[i][2] = 0;
         score ++;
         float r2 = random(10, width - 10);
         coord[i][1] = r2;
       }
     }
  }
  if(score < 0){
    textSize(70);
    text("Game over", 250, 400);
    stop();
    
  }
  image(image[1],mouseX, y, 150, 150);
}