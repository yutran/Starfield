Particle[] stars = new Particle[500];
void setup()
{
  size(500, 500);

  for (int i = 0; i < stars.length; i++)
    stars[i] = new TopParticle();
  for (int i = 0; i < 3; i++) {
    stars[i] = new MiddleParticle(i);
  }
  for (int i = 3; i < 10; i++) {
    stars[i] = new BottomParticle();
    }
}
void draw()
{
  fill(0,50);
  rect(0, 0 ,500, 500);
  for (int i = 0; i < stars.length; i++) {
    stars[i].move(i);
    stars[i].show();
  }
}
class TopParticle implements Particle
{
  double angle;
  float speed, xPos, yPos;
  TopParticle() {
    xPos = 250;
    yPos = 250;
    angle = Math.random()*2*PI;
    speed = (float)Math.random()*2;
  }
  public void move(int a) {
    if ((xPos < 0 || xPos > 600) || (yPos < 0 || yPos > 600)) {
      angle = Math.random()*2*PI;
      speed = (float)Math.random();
    }
    xPos = xPos+speed*(cos((float)angle));
    yPos = yPos+speed*(sin((float)angle));
  }
  public void show() {
    noStroke();
    fill(255);
    ellipse(xPos, yPos, 5, 5);
  }
}
class MiddleParticle implements Particle
{
  float size, xPos, yPos;
  MiddleParticle(int x) {
    size = 0;
    xPos = 200;
    yPos = 200;
  }
  public void move(int x) {
    if ((xPos<0 || xPos>600) || (yPos<0 || yPos>600)) {
    }
    if (x==0) {
      xPos = xPos+1; yPos = yPos+1;
    }
    if (x==1) {
      xPos = xPos+1; yPos = yPos-1;
    }
    if (x==2) {
      xPos = xPos-1; yPos = yPos+1;
    }
  }
  public void show() {
    size++;
    ellipse(xPos,yPos,size,size);
  }
}
class BottomParticle extends TopParticle
 {
 public void show() {
   ellipse(xPos,yPos,20,20);   
 }
 }
interface Particle
{
  public void move(int x);
  public void show();
}
