void dibLinea(float a1, float a2) {
  float x1, y1, x2, y2;
  x1 = radio*sin(a1)+w/2;
  y1 = radio*cos(a1)+h/2;
  x2 = radio*sin(a2)+w/2;
  y2 = radio*cos(a2)+h/2;
  g1.line(x1,y1,x2,y2);
  g2.line(x1,y1,x2,y2);
}

float brillo (float a1, float a2) {
  float x1, y1, x2, y2, x, y;
  x1 = radio*sin(a1)+w/2;
  y1 = radio*cos(a1)+h/2;
  x2 = radio*sin(a2)+w/2;
  y2 = radio*cos(a2)+h/2;
  int nLin = 40;
  float sum = 0;
  for(int i=0; i<nLin; i++) {
    x = x1 + (float)i/nLin*(x2-x1);
    y = y1 + (float)i/nLin*(y2-y1);
    sum += red(g2.get((int)x, (int)y))/(float)nLin;
  }
  return sum;
}