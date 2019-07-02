public class Pongs{
  //-------- Atributos ------------
  int x,y,largo,ancho;
  //-------- Constructor ----------
  Pongs(int x1,int y1,int ancho1, int largo1){
    x = x1;
    y = y1;
    largo = largo1;
    ancho = ancho1;
  }
}

public class Ball{
  //--------- Atributos --------------
  int x,y,r;
  int speed[] = {-2,2};
  double dx,dy;
  //--------- Constructor ------------
  Ball(int x1,int y1,int r1){
    x = x1;
    y = y1;
    r = r1 * 2;
    dx = speed[(int)random(0,1)];
    dy = speed[(int)random(0,1)];
  }
}

void keyPressed(){
  switch(keyCode){
    case(87): //---- W -------
      pongi.y -= speed;
      if(pongi.y == -speed){
        pongi.y += speed;
      }
      break;
    case(83): //---- S -------
      pongi.y += speed;
      if(pongi.y == (width - (pongi.largo - speed))){   //355 = 400-45
        pongi.y -= speed;  //     = width - (pongd.largo - speed)
      }
      break;
    case(38): //---- Flecha arriba ----
      pongd.y -= speed;
      if(pongd.y == -speed){
        pongd.y += speed;
      }
      break;
    case(40): //---- Flecha abajo -----
      pongd.y += speed;
      if(pongd.y == (width - (pongd.largo - speed))){
        pongd.y -= speed;
      }
      break;
  }
}

void rebotar(){
  ball.x += ball.dx;
  ball.y += ball.dy;
  //--------- vertical ------------
  if(ball.y < 0){
    ball.dy = 2;
    ball.y += ball.dy;
  }
  else if(ball.y > 400){
    ball.dy = -2;
    ball.y += ball.dy;
  }
  //----------- Pong derecho ----------
  else if(ball.x > pongd.x && ball.y > pongd.y && ball.y < (pongd.y + pongd.largo)){
    ball.dx = -1;
    ball.dy = ball.speed[(int)Math.random() * 1];
    ball.x += ball.dx;
    ball.y += ball.dy;
  }
  //----------- Pong izquierdo --------
  else if(ball.x < (pongi.ancho) && ball.y > pongi.y && ball.y < (pongi.y + pongi.largo)){
    ball.dx = 1;
    ball.dy = ball.speed[(int)Math.random() * 1];
    ball.x += ball.dx;
    ball.y += ball.dy;
  }
  //----------- Anotar ----------------
  if(ball.x > 400 || ball.x < 0){
    ball.x = 200;
    ball.y = 200;
    ball.dx = ball.speed[(int)random(0,1)];
    ball.dy = ball.speed[(int)random(0,1)];
  }
}
//-------------------------------------
void update(){
  background(0);
  fill(255,255,255);
  rect(pongi.x,pongi.y,pongi.ancho,pongi.largo);
  rect(pongd.x,pongd.y,pongd.ancho,pongd.largo);
  ellipse(ball.x,ball.y,ball.r,ball.r);
}
