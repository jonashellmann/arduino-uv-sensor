// Importiere Libraries
#include <Adafruit_GFX.h>
#include <Adafruit_ST7735.h>
#include <SPI.h>

#define TFT_CS 10
#define TFT_RST 9
#define TFT_DC 8

int MED = 300; // Individuelle minimale Erythemdosis
float remainingUvDosis = MED;
int updateRateSec = 2;

Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

void setup(void) {
  // Display initialisieren
  tft.initR(INITR_BLACKTAB);
  printWelcomeMessage();
  delay(4000);
}

void loop() {
  // Sensor auslesen und auf dem Bildschirm anzeigen
  printOnDisplay(readSensor());
  // Zwei Sekunden warten
  delay(updateRateSec * 1000);
}

void printWelcomeMessage() {
  resetDisplay();

  tft.setTextSize(1);
  tft.setTextColor(0xFFFF); // Weiß
  tft.setCursor(2, 10);
  tft.print("Messgeraet fuer");
  tft.setCursor(2, 20);
  tft.print("UV-Strahlung");

  tft.setTextSize(6);
  tft.setCursor(2, 50);
  tft.print("S");
  tft.setTextSize(1);
  tft.setTextColor(0xFFFF); // Weiß
  tft.setCursor(35, 50);
  tft.print("ystem");
  tft.setCursor(35, 60);
  tft.print("oftware");
  tft.setCursor(35, 80);
  tft.print("ysteme");
  tft.setTextColor(0x07E0, 0xFFFF); // Grün auf Weiß
  tft.setCursor(5, 70);
  tft.print("& verteilte");

  tft.setTextColor(0xFFFF); // Weiß
  tft.setCursor(2, 110);
  tft.print("Jonas Hellmann");
}

void resetDisplay() {
  tft.fillScreen(ST77XX_BLACK);
}

void printOnDisplay(int uvIndex) {
  resetDisplay();
  printHeading();

  int color = 0;
  String text1 = "";
  if (uvIndex >= 11) {
    color = 0xF81F; // Lila
    text1 = "Extreme Belastung";
  }
  else if (uvIndex >= 8) {
    color = 0xF800; // Rot
    text1 = "Sehr hohe Belastung";
  }
  else if (uvIndex >= 6) {
    color = 0xFBE0; // Orange
    text1 = "Hohe Belastung";
  }
  else if (uvIndex >= 3) {
    color = 0xFFE0; // Gelb
    text1 = "Mittlere Belastung";
  }
  else {
    color = 0x07E0; // Grün
    text1 = "Niedrige Belastung";
  }

  int minutes = calculateRemainingSunSeconds(uvIndex) / 60;
  char strMinutes[12];
  sprintf(strMinutes, "%d", minutes);
  char text2[80];
  if (uvIndex == 0) {
    strcpy(text2, "");
  }
  else {
    strcpy(text2, "Restzeit (min): ");
    strcat(text2, strMinutes);
  }

  int color2 = 0xFFFF; // Weiß
  if (minutes <= 5) {
    color2 = 0xF800; // Rot
  }
  else if (minutes <= 15) {
    color2 = 0xFBE0; // Orange
  }
  
  printValue(uvIndex, color);
  printText(text1, text2, color2);
}

float calculateRemainingSunSeconds(int uvIndex) {
  // Restliche Zeit in der Sonne in Sekunden berechnen über die Formel:
  // t = Erythemdosis - (1.5 * UV-Index)
  float remainingSunSec = 0;
  if (uvIndex > 0) {
    remainingSunSec = remainingUvDosis / (1.5 * uvIndex);
    remainingSunSec *= 60;
  }

  // Restliche Erythemdosis reduzieren um "verbrauchte" Menge im Messintervall
  remainingUvDosis -= (1.5 * uvIndex) / (60 / updateRateSec);

  return remainingSunSec;
}

void printHeading() {
  tft.setCursor(17, 5);
  tft.setTextSize(2);
  tft.setTextColor(0xFFFF); // Weiß
  tft.print("UV-Index");
}

void printValue(int uvIndex, int color) {
  tft.drawRect(19, 30, 90, 70, color);
  tft.drawRect(20, 31, 88, 68, color);

  tft.setTextSize(6);
  tft.setTextColor(color);
  if (uvIndex >= 10) {
    tft.setCursor(30, 45);
  }
  else {
    tft.setCursor(50, 45);
  }
  
  tft.print(uvIndex);
}

void printText(String text1, String text2, int color) {
  tft.setTextSize(1);
  
  tft.setTextColor(0xFFFF); // Weiß
  tft.setCursor(3, 110);
  tft.print(text1);

  tft.setTextColor(color);
  tft.setCursor(3, 120);
  tft.print(text2);
}

int readSensor()
{
  int UVIndex = 0;
  int sensorValue = 0;

  // Spannung am analogen PIN 0 auslesen, an dem der Sensor angeschlossen ist
  sensorValue = analogRead(0);
  // Umwandlung der gelesenen Spannung in Milli-Volt
  int voltage = (sensorValue * (5.0 / 1023.0))*1000;

  // Umwandlung von Milli-Volt in den gemessenen UV-Index
  if(voltage<50)
  {
    UVIndex = 0;
  }else if (voltage > 50 && voltage <= 227)
  {
    UVIndex = 0;
  }else if (voltage > 227 && voltage <= 318)
  {
    UVIndex = 1;
  }
  else if (voltage > 318 && voltage <= 408)
  {
    UVIndex = 2;
  }else if (voltage > 408 && voltage <= 503)
  {
    UVIndex = 3;
  }
  else if (voltage > 503 && voltage <= 606)
  {
    UVIndex = 4;
  }else if (voltage > 606 && voltage <= 696)
  {
    UVIndex = 5;
  }else if (voltage > 696 && voltage <= 795)
  {
    UVIndex = 6;
  }else if (voltage > 795 && voltage <= 881)
  {
    UVIndex = 7;
  }
  else if (voltage > 881 && voltage <= 976)
  {
    UVIndex = 8;
  }
  else if (voltage > 976 && voltage <= 1079)
  {
    UVIndex = 9;
  }
  else if (voltage > 1079 && voltage <= 1170)
  {
    UVIndex = 10;
  }else if (voltage > 1170)
  {
    UVIndex = 11;
  }
  return UVIndex;
}
