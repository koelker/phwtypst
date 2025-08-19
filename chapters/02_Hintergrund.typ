#import "../config/dependencies.typ": *

= Hintergrund <sec:hintergrund>

== Sensorik und Messprinzip <subsec:sensorik>

Wir nutzen einen digitalen Temperatursensor (1-Minuten-Abtastung) im Arbeitsbereich in etwa 1,2 m Höhe. Die Platzierung beeinflusst die Messqualität erheblich#vgl(<schmidt2019_sensors>, page: 49).

#abbildung(
  "../images/placeholder.png",
  lbl: <fig:sensor_arbeitsplatz>,
)[Messaufbau -- Sensor am Arbeitsplatz (Position und Höhe)]

== Zeitreihen-Grundlagen <subsec:zeitreihen>

Zur Bewertung der Prognosequalität nutzen wir die @rmse @khan2023_rmse; @garcia2020_timeseries:

#gleichung()[
  $ "RMSE" = sqrt(frac(1, n)sum_(i=1)^(n)(y_i - hat(y)_i)^2) $
][Quadratische Abweichung] <eq:quad>


Die @rmse misst die mittlere quadratische Abweichung zwischen Beobachtung $y_i$ und Vorhersage $hat(y)_i$ (je kleiner, desto besser).
