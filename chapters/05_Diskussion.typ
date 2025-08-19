#import "../config/dependencies.typ": *

= Diskussion <sec:diskussion>

== Interpretation <subsec:interpretation>

Die Temperatur folgt einem *tageszeitlichen Rhythmus* mit *Lüftungsspitzen*. Belegung und Sonneneinstrahlung sind plausibel treibende Faktoren.

== Limitationen <subsec:limitationen>

#list(
  [Nur ein Sensor, mögliche Messbias durch Platzierung],
  [Kurzer Zeitraum],
  [Keine exogenen Variablen (Außentemperatur, Sonneneinstrahlung)]
)

== Implikationen <subsec:implikationen>

#list(
  [Sensorposition validieren],
  [Lüftungsprotokolle koppeln],
  [Für bessere Vorhersagen: externe Variablen integrieren (z.B. mit ARIMAX/Prophet)]
)