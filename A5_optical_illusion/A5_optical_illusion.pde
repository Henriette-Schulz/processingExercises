/***************************************************************
Woche 3, Arbeitsblatt 6 - Zählschleifen und optische Täuschungen 
Zusatzaufgabe 3
Henriette Schulz, 16.04.2020
****************************************************************/


int seite = 20;    //Seitenlänge eines Quadrates

//zeichnet ein Quadrat mit
//x, y: Startpunkt oben links
//farbe: Füllfarbe des Quadrates
//kleineQudrate: 1 --> links oben, rechts unten 
//               2 --> links unten, rechts oben
//               sonst --> keine kleinen Quadrate
void quadrat(int x, int y, int farbe, int kleineQuadrate) {
  fill(farbe);
  rect(x, y, seite, seite);

  //kleine Quadrate links oben, rechts unten
  if (kleineQuadrate == 1) {
    fill(255 - farbe);  //Farbe umkehren
    rect(x + 2, y + 2, 5, 5);
    rect(x + seite - 7, y + seite - 7, 5, 5);
  }
  
  //kleine Quadrate links unten, rechts oben
  if (kleineQuadrate == 2) {
    fill(255 - farbe);  //Farbe umkehren
    rect(x + 2, y + seite - 7, 5, 5);
    rect(x + seite - 7, y + 2, 5, 5);
  }
}

//zeichne ein großes Quadrat bestehend aus einzelnen Quadraten
//x, y: Startpunkt oben links
//anzahl: Anzahl der kleinen Quadrate pro Seite
//kleine Quadrate --> siehe Methode quadrat
void quadrate(int x, int y, int anzahl, int kleineQuadrate) {
  
  //äußere Schleife für Zeilen
  for (int i = 0; i < anzahl; i++) {
    
    //innere Schleife für einzelne Zeile
    for (int j = 0; j < anzahl; j++) {
      //zeichne einzelnes Quadrat
      //Farbe wechselt innerhalb der Zeile und pro Zeile
      quadrat(x + j * seite, y + i * seite, ((j + (i % 2)) % 2) * 255, kleineQuadrate);
    }
  }
}

void setup() {
  size(480, 480);
  background(255);
  noStroke();
  
  //fange links oben an
  int x = 0;
  int y = 0;
  //zeichne 24*24 Quadrate mit inneren Quadraten links oben, rechts unten
  quadrate(x, y, 24, 1);

  //fange 6*6 Quadrate versetzt an
  x = 6 * seite;
  y = 6 * seite;
  //zeichne 12*12 Quadrate ohne innere Quadrate
  quadrate(x, y, 12, 0);

  //fange 7*7 Quadrate versetzt an
  x = 7 * seite;
  y = 7 * seite;
  //zeichne 10*10 Quadrate mit inneren Quadraten links unten, rechts oben
  quadrate(x, y, 10, 2);
}
