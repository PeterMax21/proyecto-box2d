class Box 
{

Body body;
float w;
float h;

Box(float x, float y) 
{
  w = 8;
  h = w;
  makeBody(new Vec2(x,y),w,h);
}

void killBody() 
{
  box2d.destroyBody(body);
}

boolean done() 
{
Vec2 pos = box2d.getBodyPixelCoord(body);  
  if (pos.y > height+w*h) 
   {
     killBody();
   }
  return false;
}

void display() 
{
Vec2 pos = box2d.getBodyPixelCoord(body);
float a = body.getAngle();

rectMode(CENTER);
pushMatrix();
//ellipse(0,0,w,h);
translate(pos.x,pos.y);
rotate(-a);
fill(175);

if(mouseX>0 && mouseX<210 && mouseY>0 && mouseY<208)
  {
   image(img8,0,0,30,30);
  }
  if(mouseX>210 && mouseX<420 && mouseY>0 && mouseY<208)
  {
   image(img7,0,0,30,30);
  }
  if(mouseX>0 && mouseX<210 && mouseY>208 && mouseY<417)
  {
    image(img6,0,0,30,30);
  }
  if(mouseX>210 && mouseX<420 && mouseY>208 && mouseY<417)
  {
    image(img9,0,0,30,30);
  }

popMatrix();
}

void makeBody(Vec2 center, float w_, float h_) 
{
PolygonShape sd = new PolygonShape();
float box2dW = box2d.scalarPixelsToWorld(w_/2);
float box2dH = box2d.scalarPixelsToWorld(h_/2);
sd.setAsBox(box2dW, box2dH);
FixtureDef fd = new FixtureDef();
fd.shape = sd;
fd.density = 1;
fd.friction = 0.3;
fd.restitution = 0.5;
BodyDef bd = new BodyDef();
bd.type = BodyType.DYNAMIC;
bd.position.set(box2d.coordPixelsToWorld(center));
body = box2d.createBody(bd);
body.createFixture(fd);
  }
}
