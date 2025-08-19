#import "../config/dependencies.typ": *

= Methodik <sec:methodik>

== Datenerhebung <subsec:datenerhebung>

#list(
  [*Frequenz*: 1 Messpunkt/Minute],
  [*Zeitraum*: 14 Tage],
  [*Variablen*: Zeitstempel, Temperatur [°C]],
  [*Kontext*: Belegung und Lüfuntsfenster werden protokolliert#vgl(<li2022_ventilation>, page: 205)],
)

#abbildung(
  "../images/placeholder.png",
  lbl: <fig:grundriss_sensorposition>,
)[Grundriss mit Sensorposition und Fenster/Airflow-Richtung]

== Datenaufbereitung <subsec:datenaufbereitung>

#list(
  [Entfernen offensichtlicher Ausreißer (< 10°C oder > 40°C)],
  [Interpolation kurzer Lücken $<=$ 5 Minuten],
  [Gleitender Mittelwert (15 Minuten) zur Glättung#vgl(<garcia2020_timeseries>, page: 55)],
)

Der Code für diese Aufbereitung kann #anhang(<lst:py-daten>, <app:python-listing>) entnommen werden.

== Analyseverfahren

#list(
  [*Deskriptiv*: Mittelwerte, Min/Max, Standardabweichung],
  [*Zeitmuster*: Tagesprofile (08-18 Uhr vs. Nacht)#vgl(<mueller2021_office_temp>, page: 160)],
  [*Baseline-Prognose*: naive Persistenz (t-1)],
)
