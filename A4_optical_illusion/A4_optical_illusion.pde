/***************************************************************
Woche 3, Arbeitsblatt 6 - Zählschleifen und optische Täuschungen 
Zusatzaufgabe 2
Henriette Schulz, 16.04.2020
****************************************************************/

/*

Doppelraute mit
                    _
*                  *
***              ***
****            ****
******        ****** c
********    ********  
*********  *********
********************
********************_
 ******************|
   **************  |
     **********    | b
       ******      |
         **--------+-
          |   a    |

*/



float x = 0;                           //Startpunkt x
float y = 0;                           //Startpunkt y
float c = 50;                          //Seitenlänge der Raute
float alpha = 60;                      //Winkel gegenüber von a in Grad
float beta = 90 - alpha;               //Winkel gegenüber von b in Grad
 
float b = c * sin(beta * PI / 180);    //Anwendung des Sinussatzes, Umrechnung von Grad in Radiant
float a = c * sin(alpha * PI / 180);   //Anwendung des Sinussatzes, Umrechnung von Grad in Radiant
  
float versatz = 0;                     //Verschiebung der einzelnen Reihen
                                       //jede zweite Reihe ist verschoben


//zeichnet eine Doppelraute
//x, y: Startpunkt für linke obere Ecke
//a, b, c: siehe Skizze
void doppelRaute(float x, float y, float a, float b, float c){
 
  //linke Raute
  fill(#FFFFFF);
  quad(x, y + c, x + a, y + b + c, x + a, y + b, x, y);
  
  //rechte Raute
  fill(#888888);
  quad(x + a, y + b + c, x + 2 * a, y + c, x + 2 * a, y, x + a, y + b);
}

void setup(){
  size(605, 375);
  background(255, 192, 0);
  noStroke();

  //äußere Schleife für Zeilen
  for(int j = 0; j < 5; j++){
    versatz = (j % 2) * a;    //jede zweite Zeile versetzt zeichnen
    
    //innere Schleife für Doppelrauten innerhalb der Zeile
    for(int i = 0; i < 10; i++){
      doppelRaute(x + 2 * i * a - versatz, y + j * (c + b), a, b, c); 
    }
  }
  
}
