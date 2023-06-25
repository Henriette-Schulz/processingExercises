/***************************************************************
Woche 2, Arbeitsblatt 4 - Verzweigungen 
Minigolf
Henriette Schulz, 16.04.2020
****************************************************************/

//Position Ball
float dx = 0;                  //für Bewegung in x-Richtung
float dy = 0;                  //für Bewegung in y-Richtung
float x = 50;                  //Position des Balles x
float y = 225;                 //Position des Balles y
float lochX = 400;             //Position des Loches x
float lochY = 225;             //Position des Loches y
float durchmesserLoch = 60;    //Durchmesser des Loches
int durchmesserBall = 50;      //Durchmesser des Balles
int versuch = 0;               //Zähler für Versuche

//Behandlung für Mausklick
void mouseClicked() {
 
  versuch++;                      //Anzahl der Versuche erhöhen
  float deltax = (mouseX - x);    //bestimme Richtung des neuen Versuches x
  float deltay = (mouseY - y);    //bestimme Richtung des neuen Versuches y
  
  //berechne Bewegung für neuen Versuch
  dx = 10 * deltax / max(abs(deltax), abs(deltay));
  dy = 10 * deltay / max(abs(deltax), abs(deltay));
}

//zeichne den Ball
//x, y: Mittelpunkt des Balles
void ball(float x, float y) {
  fill(#FFFF00);
  ellipse(x, y, durchmesserBall, durchmesserBall);
    
}

//zeichne das Loch
//x, y: Mittelpunkt des Loches
void loch(float x, float y) {
  fill(#000000);
  ellipse(x, y, durchmesserLoch, durchmesserLoch);    
}

//Ist der Ball im Loch?
//x, y: Position des Balles
boolean treffer(float x, float y){
  //Abstand des Balles zum Loch
  float deltaX = abs(x - lochX);
  float deltaY = abs(y - lochY);
  
  //Anwendung Satz des Pythagoras
  //(Mittelpunkt des Balles soll innerhalb des Locjkreises sein)
  return (sq(durchmesserLoch/2) > (sq(deltaX) + sq(deltaY)));
}

//kehre Richtung um, wenn Ball auf die Bande trifft
float bande(float pos, float delta){
  if ((pos < 25) || (pos > 475)) {
      delta = -1 * delta;
  }
  
  return delta;
}

void setup() {
  size(500, 500);
  noStroke();
  textSize(30);
}

void draw() {
  background(#FFFFFF);
  fill(0, 102, 153);
  text("Versuch: " + versuch, 170, 40);    //gebe Anzahl der Versuche aus
  
  loch(lochX, lochY);                      //zeichne das Loch
  
  //wenn kein Treffer
  if (!treffer(x, y)) {
    ball(x, y);                            //zeichne Ball
    
    x = x + dx;                            //x und y abhängig von Bewegung
    y = y + dy;
  
    dx = 0.99 * dx;                        //verlangsame Ball
    dy = 0.99 * dy;
    
    dx = bande(x, dx);                     //reagiere auf Bandentreffer
    dy = bande(y, dy);
    
  } else {                                 //wenn Treffer
    fill(0, 102, 153);
    text("Treffer", 170, 80);              //gib Treffer aus
  }
  
}
