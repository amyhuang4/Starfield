PImage gar;
Particle [] starfield = new Particle [300];
void setup()
{
  size(600, 600);
  gar = loadImage("pixil-layer-Background.png");
  for (int i = 1; i < starfield.length; i++)
  {
    starfield[i] = new Particle();
  }
  starfield[0] = new OddballParticle();
}
void draw()
{
  background(0);
  for (int i = 0; i < starfield.length-1; i++)
  {
    starfield[i].show();
    starfield[i].move();
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
    myAngle = Math.random()*2*PI;
    myX = myY = 300;
    mySpeed = Math.random()*5+3;
    myColor = color((int)(Math.random()*128+128), (int)(Math.random()*128+128), (int)(Math.random()*128+128));
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    if (mousePressed) {
      myX = mouseX;
      myY = mouseY;
      myAngle = Math.random()*2*PI;
      mySpeed = Math.random()*5+3;
    }
  }
  void show() {
    fill(myColor);
    star((float)myX, (float)myY, 2);
  }
  void star(float x, float y, float s) {
    noStroke();
    fill(myColor);
    triangle(x-(11.92/s), y+(16.058/s), x-(0.08/s), y+(7.638/s), x-(7.28/s), y+(2.286/s));
    triangle(x-(0.08/s), y+(7.638/s), x+(11.58/s), y+(16.3/s), x+(7.24/s), y+(2.436/s));
    triangle(x+(7.24/s), y+(2.436/s), x+(19.08/s), y-(5.984/s), x+(4.56/s), y-(6.134/s));
    triangle(x+(4.56/s), y-(6.134/s), x+(0.2/s), y-(19.998/s), x-(4.42/s), y-(6.226/s));
    triangle(x-(4.42/s), y-(6.226/s), x-(18.96/s), y-(6.376/s), x-(7.28/s), y+(2.286/s));
    ellipse(x, y, 15/s, 15/s);
  }
}

class OddballParticle extends Particle
{
  OddballParticle() {
    myX = myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
  }
  void show()
  {
    image(gar, (float)myX-70, (float)myY-80);
  }
}
