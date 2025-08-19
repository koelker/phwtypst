#import "../config/dependencies.typ": *

= Ergebnisse <sec:ergebnisse>

== Deskriptive Werte <subsec:deskriptive-werte>

#tabelle(
  columns: (1fr, 1fr),
  align: horizon,
  table.header(
    [*Kennzahl*],
    [*Wert*],
  ),
  [Mittelwert [°C]],
  [22,4],
  [Median [°C]],
  [22,3],
  [Minimum [°C]],
  [19,1],
  [Maximum [°C]],
  [25,8],
  [Std.-Abw. [°C]],
  [1,7],
)[Deskriptive Statistik (gesamter Zeitraum)]

Eine grafische Darstellung ist in  #anhang(<fig:liniendiagramm>, <app:diagramme>) vorzufinden.

== Tageszeitliche Muster <subsec:muster>

#list(
  [*Vormittag (08 - 12 Uhr)*: leichter Anstieg (Ausstattung & Belegung)],
  [*Mittag (12 - 14 Uhr)*: erhöhte Variabilität (Lüften)],
  [*Nachmittag (14 - 18 Uhr)*: Plateu mit gelegentlichen Peaks],
)

Diese Muster sind konsistent mit Beobachtungen in Open-Space-Büros#vgl(<mueller2021_office_temp>, page: 147).

#tabelle(
  columns: (1fr, 1fr, 1fr),
  align: horizon,
  table.header(
    [*Stunde*],
    [*Mittel [°C]*],
    [*Std.-Abw. [°C]*],
  ),
  [08],
  [21,9],
  [0,6],
  [12],
  [22,8],
  [0,9],
  [16],
  [23,2],
  [0,8],
)[Tagesprofile (Mittelwerte pro Stunde)]

== Prognosegüte <subsec:prognosegüte>

#list(
  [*Baseline (Persistenz t-1)*: @rmse gemäß @eq:quad ca. *0,25-0,25 °C* (beispielhaft).],
  [Durch Glättung sinkt der Fehler auf trendigen Abschnitten; bei plötzlichem Lüften steigt er.],
)
