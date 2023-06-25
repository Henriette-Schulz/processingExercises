/***************************************************************
Woche 3, Arbeitsblatt 6 - Zählschleifen und optische Täuschungen
Aufgabe 1, Kaffeehaus-Täuschung
Henriette Schulz, 16.04.2020
****************************************************************/

int yStart = 20;    //Start der Zeichnung nach 20 Pixeln

//zeichne parallele Geraden mit grauer Farbe
//anzahl: Anzahl der Geraden
void parallelen(int anzahl){
  stroke(#888888);
  strokeWeight(3);
  
  for(int i = 0; i < anzahl; i++){
    line(0, yStart + 40 * i, width, yStart + 40 * i);
  }
  noStroke();
}

//zeichne eine Zeile mit 8 schwarzen Quadraten (40*40 Pixel)
//wobei immer ein weißes Quadrat (Hintergrund) frei gelassen wird
//x, y: Startkoordinaten
void quadrateZeile(int x, int y){
  fill(#000000);
  for(int i = 0; i < 8; i++){
    rect(x + i * 80, y, 40, 40);
  }
}

void setup(){
  size(630, 400);
  background(#FFFFFF);

  //zeichne 10 Zeilen mit Quadraten, die jeweils einen anderen Einzug haben
  //sie sind in der Reihenfolge 1, 2, 3, 2, 1, 2, 3, 2, 1
  
  int einzug = 1;
  int richtung = 1;
  for(int i = 0; i < 9; i++){
    //bestimme Richtung abhängig vom Einzug
    if ((einzug == 3) && (richtung == 1)){
      richtung = -1;
    }
    if ((einzug == 1) && (richtung == -1)){
      richtung = 1;
    }
    //zeichne Zeile mit Quadraten
    quadrateZeile(einzug * 8, i * 40 + yStart);
    //berechne Einzug
    einzug = einzug + richtung;
  }
  
  //zeichne Parallelen
  parallelen(10);
}
