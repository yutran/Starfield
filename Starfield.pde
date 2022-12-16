Particle[] star = new Particle[500];
int dots = 0;

void setup(){
 size(1000,1000);
   for(int i = 0; i <= star.length-1; i++){
    star[i] = new Particle();
    star[0] = new OddballParticle();
  }
}

void draw(){
  background(0);
  for(int i = 0; i <= star.length-1; i++){
  star[i].show();
  star[i].move();
  }
}

class Particle{
  int myColor;
  double myX, myY, myZ, mySpeed;
  Particle(){
    if (dots%2 == 0)
      myColor = color((int)(Math.random()*200));
    else
      if ((int)(Math.random()*5) == 1)
        myColor = color(255);
      else
    myX = 250;
    myY = 250;
    myZ = Math.random()*(2*Math.PI);
    mySpeed = Math.random()*15;
  }
  void move(){
    myX = (myX + (Math.cos(myZ)*mySpeed));
    myY = (myY + (Math.sin(myZ)*mySpeed));
  }
  void show(){
    fill(myColor);
    stroke(myColor);
    ellipse((float)myX,(float)myY,10,10);
  }
}
class OddballParticle extends Particle{
    OddballParticle(){
      if (dots%2 == 0)
        myColor = color(255);
      else
      myX = 50;
      myY = 50;
      myZ = Math.random();
      mySpeed = Math.random()*20;
    }
    void move(){
      myX = (myX + (Math.cos(myZ)*mySpeed));
      myY = (myY + (Math.sin(myZ)*mySpeed));
    }
    void show(){
      fill(myColor);
      stroke(myColor);
      ellipse((float)myX,(float)myY,100,100);
      ellipse((float)myY,(float)myX,100,100);
    }
}
