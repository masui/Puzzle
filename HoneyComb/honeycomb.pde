// 最短の距離を求めるシミュレーション

class Point {
  float x,y;
  Point(float xx, float yy){
    x = xx;
    y = yy;
  }
}

Point[] points;
Point p1,p2,p3,p4,p5;

int WINWIDTH = 500;
int WINHEIGHT = 500;

void setup(){
  size(WINWIDTH,WINHEIGHT);
  points = new Point[3];
  p1 = new Point(10.0,200.0);
  p2 = new Point(100.0,490.0);
  p3 = new Point(300.0,490.0);
  p4 = new Point(490.0,200.0);
  p5 = new Point(250.0,10.0);
  points[0] = new Point(30.0,40.0);
  points[1] = new Point(50.0,60.0);
  points[2] = new Point(70.0,80.0);
}

float dist(Point p1,Point p2)
{
  return sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
}
 
float total()
{
  return
  dist(p1,points[0]) +
  dist(p2,points[0]) +
  dist(p3,points[1]) +
  dist(p4,points[1]) +
  dist(points[0],points[2]) +
  dist(points[1],points[2]) +
  dist(p5,points[2]);
}


void loop(){
  background(213,200,255);
 fill(0,0,0);
 line(p1.x,p1.y,points[0].x,points[0].y);
 line(p2.x,p2.y,points[0].x,points[0].y);
 line(p3.x,p3.y,points[1].x,points[1].y);
 line(p4.x,p4.y,points[1].x,points[1].y);
 line(points[0].x,points[0].y,points[2].x,points[2].y);
 line(points[1].x,points[1].y,points[2].x,points[2].y);
 line(p5.x,p5.y,points[2].x,points[2].y);

 float t = 0.0;
 float tt;
 float origx, origy;
 float newx, newy;
 int x,y;
 int i;

 for(i=0;i<3;i++){
   origx = points[i].x;
   origy = points[i].y;
   newx = origx;
   newy = origy;
   t = total();
   for(x = -1;x<=1;x++){
     for(y = -1;y<=1;y++){
       points[i].x = origx + x;
       points[i].y = origy + y;
       tt = total();
       if(tt < t){
         newx = origx + x;
         newy = origy + y;
         t = tt;
       }
     }
    }
    points[i].x = newx;
    points[i].y = newy;
  }
}


