void setup(){
  size(400,400);
}


int speed = 5;
Pongs pongi = new Pongs(0,150,10,50);
Pongs pongd = new Pongs(390,150,10,50);
Ball ball = new Ball(200,200,10);

void draw(){
  update();
  rebotar();
  keyPressed();
}
