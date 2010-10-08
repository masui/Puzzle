//
// $B!V%S%k%2%$%D$NF~<R;n83!W$K=P$F$-$?LdBj$r(BProcessing$B$G:n$C$F$_$?$b$N!#(B
//

int MARGIN = 100;
int RADIUS = 200;
float centerx,centery;
float oposx, oposy; // $B54$N0LCV(B
float posx, posy;   // $B?M$N0LCV(B
float ospeed = 4.0; // $B54$NB.EY(B
float speed =  1.0; // $B?M$NB.EY(B

void setup(){
  size((RADIUS+MARGIN)*2,(RADIUS+MARGIN)*2);
  centerx = RADIUS + MARGIN;
  centery = RADIUS + MARGIN;
  oposx = 0.0;
  oposy = RADIUS;
  posx = 0.0;
  posy = 0.0;
}

void loop(){
  float oangle,odelta;
  float angle,delta;
  float mangle;
  float mx, my; 
  background(200,140,255);
  fill(200,200,200);
  ellipse(centerx-RADIUS,centery-RADIUS,RADIUS*2,RADIUS*2);

  // $B54$N3QEY(B
  oangle = atan2(oposy,oposx);
  // $B%R%H$N3QEY(B
  angle = atan2(posy,posx);
  delta = angle - oangle;
  if(delta < 0) delta += PI * 2;
  odelta = ospeed / RADIUS;
  if(delta > PI) odelta = -odelta;

  oangle += odelta;
  oposx = cos(oangle) * RADIUS;
  oposy = sin(oangle) * RADIUS;
  fill(255,255,0);
  rect(centerx+oposx-5,centerx+oposy-5,10,10);

  mx = mouseX - centerx;
  my = mouseY - centery;
  mangle = atan2(my-posy,mx-posx);
  posx += cos(mangle) * speed;
  posy += sin(mangle) * speed;
  fill(0,0,255);
  rect(centerx+posx-5,centerx+posy-5,10,10);
}



