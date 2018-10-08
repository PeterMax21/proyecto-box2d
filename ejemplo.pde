import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
Box2DProcessing box2d;
ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;

void setup()
{
  size(420,417);
  img1= loadImage("primavera1.jpg");
  img2= loadImage("verano1.jpg");
  img3= loadImage("otoño1.jpg");
  img4= loadImage("invierno1.jpg");
  img5= loadImage("reloj.png");
  img6= loadImage("flo2.png");
  img7= loadImage("hoja.png");
  img8= loadImage("copo.png");
  img9= loadImage("sol.png");
  
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  boundaries.add(new Boundary(width/2,height-115,width/2-50,0,0));
  boundaries.add(new Boundary(150,133,120,0,5));
  boundaries.add(new Boundary(270,133,120,0,-5));
  boundaries.add(new Boundary(150,245,120,0,-5));
  boundaries.add(new Boundary(270,245,120,0,5));
}

void draw()
{ 
   background(img4);
   if(mouseX>0 && mouseX<210 && mouseY>0 && mouseY<208)
  {
      background(img4); 
  }
  
  if(mouseX>210 && mouseX<420 && mouseY>0 && mouseY<208)
  {
      background(img3);
  }
  if(mouseX>0 && mouseX<210 && mouseY>208 && mouseY<417)
  {
    background(img1);
  }
  if(mouseX>210 && mouseX<420 && mouseY>208 && mouseY<417)
  {
    background(img2);
  }
  
  
  image(img5,80,80,250,220);
  
    box2d.step();
    
    if (random(1) < 0.1)
    {
    Box p = new Box(random(width),10);
    boxes.add(p);
    }
    
    for (Boundary wall: boundaries)
    {
    wall.display();
    }
    for (Box b: boxes)
    {
    b.display();
    }  
}
