//---------------------Variables
int pantalla=0;
int w, h;
float radio;
float angV, angN;
boolean ready;
PImage img;
PImage f1;
PFont font1;
PGraphics g1, g2;
//----------------------Libreria de audio
import processing.sound.*;
SoundFile file;

void setup() {
  img = loadImage("geisha.jpg");
  size(900, 900);
  //----------------Carga audio
  file = new SoundFile(this, "plastic.mp3");
  file.play();
  //---------------Especifica cada cuánto tiempo aparece una línea
  frameRate(100);
  inicio();
  f1= loadImage("fondo.jpg");
}

void inicio() {
  background(255);
  w = img.width;
  h = img.height;
  ready = false;
  g1 = createGraphics(w, h);
  g1.beginDraw();
  g1.background(255);
  g1.stroke(0);
  g1.strokeWeight(0.09);
  g2 = createGraphics(w, h);
  g2.beginDraw();
  g2.image(img, 0, 0);
  g2.stroke(255);
  g2.strokeWeight(0.2);
  radio = min(w, h)/2;
  angN = random(2*PI);
}

void draw() {
  
   switch (pantalla){
     
      case 0:
      
  f1 = loadImage("fondo.jpg");
  image(f1 , 0 , 0);
  
  font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 100);
     fill(random(220,83),random(70,136),3);
     text("PlasticLove",180,220);
     
   textFont (font1, 40);
     fill(#0E0476);
     text("Presiona ENTER para continuar", 150,600);
    
    
       if (keyPressed){
       if (key==ENTER);
       pantalla = 1;
      
}
break;

     case 1:

 f1 = loadImage("fondo.jpg");
  image(f1 , 0 , 0);
  
  font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 40);
     fill(#000003);
     text("A continuación se muestra un rostro ",120,180);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 40);
     fill(#000003);
     text("hecho a base de puras líneas.",170,230);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 25);
     fill(random(220,83),random(70,136),3);
     text("Canción: Plastic Love",520,70);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 25);
     fill(random(220,83),random(70,136),3);
     text("Interprete: Mariya Takeuchi",520,100);
  
   textFont (font1, 30);
     fill(#0E0476);
     text("Para ver el rostro da Click en la pantalla", 170,600);
     
     font1 = loadFont ("ComicSansMS-Bold-48.vlw");
   textFont (font1, 30);
     fill(#0E0476);
     text("Para regresar a inicio presiona BACKSPACE.",150,650);
    
    
      if (mousePressed){
       pantalla = 2;
      }
break;


     case 2:

  if(img.height>0 && ready==false) {
    inicio();
    ready = true;
  }
  angV = angN;
  float min, b, ang;
  int n = 5;
  min = 255;
  for(int i=0; i<n; i++) {
    ang = random(2*PI);
    b = brillo (angV, ang);
    if(b<min) {
      min = b;
      angN = ang;
    }
  }
  g1.beginDraw();
  g2.beginDraw();
  dibLinea(angV, angN);
  g1.endDraw();
  g2.endDraw();
  image(g1, 0, 0);
  
  
  if (keyPressed){
       if (key==BACKSPACE);
       pantalla = 0;
}
  
  
}
}



void keyPressed() {
  inicio();
}