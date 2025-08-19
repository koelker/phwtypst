# PHWTypst

> [!INFO] WIP
> Repository ist noch work in progress, Ergebnisse immer überprüfen.

In diesem Repository findet ihr ein **inoffizielles** [Typst](https://github.com/typst/typst) Template für Ausarbeitungen an der PHWT.

Bevor wir nun mit einem Quickstart-Guide beginnen, gehen Credits raus an [die PHWT LaTeX Vorlage](https://github.com/StefanMacke/latex-vorlage-phwt) die mein Leben deutlich erleichtert (und verschönert) hat.

## Installation

Um das Template nutzen zu können musst du dir lediglich [Typst herunterladen](https://github.com/typst/typst?tab=readme-ov-file#installation). Verständlicherweise benötigst du auch einen Editor. [Visual Studio Code](https://code.visualstudio.com/) eignet sich mit dem [Typst Plugin](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) ausgezeichnet.

## ToDos

- [ ] Redundanzen entfernen
- [ ] Funktion für Ausarbeitung bereitstellen -> Import als Package, statt klonen
- [ ] [drafting](https://typst.app/universe/package/drafting) implementieren

## Quickstart

1. `git clone https://github.com/koelker/phwtypst`
2. [Typst installieren](https://github.com/typst/typst?tab=readme-ov-file#installation)
3. [VS Code installieren](https://code.visualstudio.com/)
4. [Extension installieren](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

Beim Bearbeiten von Dateien kann es sein, dass VS Code dir Funktionen o.Ä. als fehlerhaft anzeigt,
wenn das Live-Preview nicht aktiv ist.

## Verwendung

### Metadaten

Wenn du mit der zuvor genannten LaTeX Vorlage vertraut bist, solltest du dich hier recht schnell zurecht finden.
Die `settings.typ` Datei im `config` Verzeichnis beinhaltet alle zu ändernen Metainformationen.
Die dort eingetragenen Daten werden auf allen Seiten (wo benötigt) referenziert. Du musst die Daten also nur an dem zentralen Ort anpassen. \
Die `assets/unterschrift.png` Datei ist ebebfalls durch deine eigene Unterschrift zu ersetzen.

### Frontmatter

Standardmäßig fügt dieses Template alle denkbaren Seiten (Danksagung, Abstract, Verzeichnisse, ...) ein.

`main.typ`
```typ
#frontmatter(
  hide-abstract: false,
  hide-acknowledgement: false,
  hide-gender-notice: false,
  hide-list-of-acronyms: false,
  hide-list-of-figures: false,
  hide-list-of-tables: false,
  hide-list-of-listings: false,
  acronym-entries: acronym-entries,
)
```
Hier können einzelne Seiten "versteckt" werden, sodass diese in der Ausarbeitung nicht erscheinen. Für alle Verzeichnisse gilt, dass diese nur dann sichtbar sind, wenn sie Inhalt darstellen. Sind keine Listings in der Ausarbeitung vorhanden, ist das Verzeichnis automatisch versteckt. Gleiches gilt für Abkürungen, Tabellen und Abbildungen.

### Hauptteil

Den Hauptteil der Ausarbeitung ist in der `content.typ` Datei enthalten. Die einzelnen Kapitel des Hauptteils sind in dem `chapters` Ordner zu erstellen und anschließend folgendermaßen in `content.typ` einzufügen:

```typ
#let chapters = (
  "01_Einleitung",
  "02_Theoretischer-Hintergrund",
  "03_Methodik",
  "04_Ergebnisse",
  "05_Diskussion",
  "06_Fazit",
)
```
Die Dateien heißen respektive `chapters/01_Einleitung.typ`, ...

### Anhang

Der Anhang wird in `appendix.typ` konfiguriert. Anders als beim Hauptteil befindet sich hier alles in einer Datei.

### Referenzieren

Das setzen eines Labels bei `#abbildung`, `#tabelle` und `#listing` erfolgt über einen Parameter (`lbl`) anstatt wie üblich nach dem Statement, da der Rückgabewert der Funktion ein `block` ist (um Quellenangaben schön darzustellen), welcher nicht referenziert werden kann. Also wird das Label als Parameter rein gegeben und in der Funktion nach der `figure` gesetzt.

Bei den oben genannten Funktionen zur Referenz (`#abbildung`, ...) kann ein Parameter `hide_source` gesetzt werden, der die Quellen-Zeile ausblendet. Das kann hilfreich sein, wenn du den `Eigene Darstellung` Text nicht da haben willst.

Üblicherweise werden den Labels je nachdem, was sie referenzieren, eine Präfix gegeben. Das ist kein Muss, ist aber zu empfehlen.

| Typ            | Präfix   | Beispiel                            |
| -------------- | -------- | ----------------------------------- |
| Abschnitt      | `sec`    | `sec:einleitung`                    |
| Unterabschnitt | `subsec` | `subsec:hintergrund-und-motivation` |
| Abbildung      | `fig`    | `fig:umsatzentwicklung-2024`        |
| Tabelle        | `tab`    | `tab:swot-matrix`                   |
| Listing        | `lst`    | `lst:add-funktion`                  |
| Anhang         | `app`    | `app:abbildungen`                   |
| Gleichung      | `eq`     | `eq:pq-formel`                      |


#### Abbildungen
*Erstellen*
```typ
#abbildung(
  "../image.png",
  "Bildunterschrift",
  source_name: <schmidt2024>,
  source_page: 10,
  lbl: <fig:beispiel>,
)
```

*Referenzieren*
> Wie @fig:beispiel zu entnehmen, handelt es sich ...

*Render*
> Wie Abbildung 1 zu entnehmen, handelt es sich ...

#### Tabellen
*Erstellen*
```typ
#tabelle(
  columns: (1fr, 1fr, 1fr),
  align_: horizon,
  inset: 7pt,
  source_name: <müller2023>,
  lbl: <tab:beispiel>,
  table.header(
    [],
    [*A*],
    [*B*],
  ),
  [Entry1],
  [Entry2],
  [Entry3],
  [Entry4],
  [Entry5],
  [Entry6],
)[Eine Beispieltabelle]
```

*Referenzieren*
> ... wie in @tab:beispiel dargestellt.

*Render*
> ... wie in Tabelle 1 dargestellt.

#### Listings
*Erstellen*
```typ
#listing(
  lbl: <lst:add>,
  source_name: <schmidt2024>,
  source_page: 42
)[```c
int add(int a, int b) {
  return a + b;
}
```][An example add function]
```

*Referenzieren*
> Das @lst:add zeigt, wie eine solche Funktion zu implementieren wäre.

*Render*
> Das Listing 1 zeigt, wie eine solche Funktion zu implementieren wäre.

#### Abschnitte

*Erstellen*
```typ
= Einleitung <sec:einleitung>

Lorem ipsum dolor sit amet.
```

*Referenzieren*
> Wie bereits in @sec:einleitung erwähnt, ...

*Render*
> Wie bereits in Abschnitt 1 erwähnt, ...

#### Anhang

*Erstellen*
```typ
= Anhang <sec:anhang>

== Zusätzliche Abbildungen <app:abbildungen>

=== Beispielabbildung <app:bsp-abbildung>

#abbildung(..., lbl: <fig:irgendein-graph>)
```

*Referenzieren*
> ... wird deutlich in #anhang(\<fig:irgendein-graph\>, \<app:bsp-abbildung\>).

*Render*
> ... wird deutlich in Abbildung 4 in Anhang B.2.

#### Gleichung
*Erstellen*
```typ
#gleichung()[
  $ "RMSE" = sqrt(frac(1, n)sum_(i=1)^(n)(y_i - hat(y)_i)^2) $
][Quadratische Abweichung] <eq:quad>
```

*Referenzieren*
> Durch @eq:quad bestätigt sich ...

*Render*
> Durch Gleichung 1 bestätigt sich ...

## Zitieren

Zum zitieren benötigst du lediglich Einträge in der `bibliography.bib` Datei, wie z.B.:

```bib
@article{müller2023,
  author  = {Müller, Hans-Peter},
  title   = {Digitale Transformation in der Katzencafé-Branche: Eine empirische Studie},
  journal = {Zeitschrift für Tiergastronomie und Technologie},
  year    = {2023},
  volume  = {15},
  number  = {3},
  pages   = {42-67}
}
```

### Indirekte Zitate

Für indirekte Zitate (im Text eine Hochzahl, Verweis zum Literaturverzeichnis in Fußnote) stellt das Template eine `#vgl` Funktion bereit.

```typ
Das ist eben so, weil es so ist#vgl(<schmidt2024>, page: 2).
```

Der `page` Parameter ist optional.

### Direkte Zitate

Für direkte Zitate (Verweis zum Literaturverzeichnis im Text) kann die eingebaute `#cite` Funktion verwendet werden.

```typ
Nach #cite(<schmidt2024>) wird das so gemacht.
```

Äquivalent dazu ist

```typ
Nach @schmidt2024 wird das so gemacht.
```

Für Seitenangaben entsprechend:

```typ
Nach @schmidt2024[p.~7] wird das so gemacht.
```

```typ
Nach #cite(<schmidt2024>, supplement: "p. 7") wird das so gemacht.
```

### Zitierstil

Der Zitierstil gibt an, wie Zitate im Text und Quellen im Literaturverzeichnis dargestellt werden. Es gibt viele verschiedene Zitierstile, mir ist eine Vorgabe der PHWT dafür aber nicht bekannt. Standardmäßig verwendet das Template den IEEE-Zitierstil. Das lässt sich aber einfach durch das Ändern des `citation_style` in `config/settings.typ` anpassen. Eine Liste aller built-in Zitierstile ist in der [Typst Dokumentation](https://typst.app/docs/reference/model/cite/#parameters-style) vorzufinden. Dazu einfach das Extend-Menü `View options` ausklappen.
Alternativ kann auch eine `.csl` Datei als Pfad angegeben werden. Eine ausführliche Liste vieler verschiedener Zitierstile mit `.csl` Datei ist [hier](https://www.zotero.org/styles) zu finden.

## Abkürzungen

Unter `config/acronyms.typ` können Abkürzungen definiert werden:

```typ
#let acronym-entries = (
  (
    key: "cpu",
    short: "CPU",
    plural: "CPUs",
    long: "Central Processing Unit",
    longplural: "Central Processing Units",
  ),
  (
    key: "api",
    short: "API",
    plural: "APIs",
    long: "Application Programming Interface",
    longplural: "Application Programming Interfaces",
  ),
  (
    key: "html",
    short: "HTML",
    long: "HyperText Markup Language",
  ),
)
```

Diese werden sobald verwendet in das Abkürzungsverzeichnis aufgenommen. Bei der ersten Verwendung der Referenz wird im Text die Langform mit angegeben, danach nicht mehr.

*Referenz*
> Mit @html werden die Inhalt der Website dargestellt, nicht aber das Aussehen. @html kann dafür, ...

*Render*
> Mit HyperText Markup Language (HTML) werden die Inhalt der Website dargestellt, nicht aber das Aussehen. HTML kann dafür, ...

## Kollaboration

Bei Änderungswünschen einfach ne' PR öffnen.
