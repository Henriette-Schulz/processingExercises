/***************************************************************
Woche 3, Arbeitsblatt 6 - Zählschleifen und optische Täuschungen
Aufgabe 3, Hermann-Gitter 2.0
Henriette Schulz, 16.04.2020
****************************************************************/

//zeichne eine Zeile mit Quadraten (seite*seite)
//x, y: Startkoordinaten
//seite: Seitenlänge des Quadrates
//abstand: Abstand zwischen den Quadraten
void quadrateZeile(int x, int y, int seite, int abstand){
  fill(#000000);
  
  //zeichne 7 Quadrate
  for(int i = 0; i < 7; i++){
    rect(x + i * (seite + abstand), y, seite, seite);
  }
}

//zeichne eine Zeile mit kleinen Quadraten (abstand*abstand)
//x, y: Startkoordinaten
//seite: Seitenlänge des großen Quadrates
//abstand: Abstand zwischen den Quadraten
void quadrateZeileZwischenraum(int x, int y, int seite, int abstand){
  fill(#FFFFFF);
  
  //zeichne 6 Quadrate
  for(int i = 1; i < 7; i++){
    rect(x + i * (seite + abstand) - abstand, y, abstand, abstand);
  }
}

void setup(){
  size(500, 500);
  background(#22CCF7);    //färbe Hintergrund blau
  noStroke();

  int seite = 60;    //Seitenlänge eines Quadrates
  int abstand = (width - 7 * seite) / 6;    //berechne resultierenden Abstand
  
  //zeichne 7 Zeilen (mit je 7 großen Quadraten)
  for (int i = 0; i < 7; i++){
    quadrateZeile(0, i * (seite + abstand), seite, abstand);
  }
  
  //zeichne 6 Zeilen (mit je 6 kleinen Quadraten für die Zwischenräume)
  for (int i = 1; i < 7; i++){
    quadrateZeileZwischenraum(0, i * (seite + abstand) - abstand, seite, abstand);
  }
}
