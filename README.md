# Typst Akademische Vorlage für wissenschaftliche Arbeiten

Eine Typst-Vorlage für Bachelor- und Masterarbeiten an der PHWT.

## 🚀 Schnellstart

1. **Typst installieren**: [Typst Download](https://typst.app/)
2. **Vorlage herunterladen** und entpacken
3. **Metadaten anpassen** in `config/meta.typ`
4. **Inhalt schreiben** in den Kapiteldateien
5. **Kompilieren**: `typst compile main.typ`

## 📁 Projektstruktur

```
├── main.typ                    # Hauptdatei - hier wird alles zusammengeführt
├── cover.typ                   # Deckblatt-Design
├── content.typ                 # Hauptinhalt-Konfiguration
├── dependencies.typ            # Externe Pakete (Glossarium)
├── bibliography.bib            # Literaturverzeichnis (BibTeX-Format)
├── apa-6th-edition.csl        # Zitationsstil (APA 6. Edition)
├── appendix-content.typ        # Inhalt für den Anhang
│
├── config/                     # Konfigurationsdateien
│   ├── meta.typ               # Metadaten (Titel, Autor, etc.)
│   ├── sections.typ           # Seitenvorlagen und Formatierung
│   ├── abbreviations.typ      # Abkürzungsverzeichnis
│   └── citations.typ          # Zitationshelfer
│
├── sections/                   # Einzelne Dokumentabschnitte
│   ├── table-of-contents.typ  # Inhaltsverzeichnis
│   ├── abstract.typ           # Abstract/Zusammenfassung
│   ├── list-of-figures.typ    # Abbildungsverzeichnis
│   ├── list-of-tables.typ     # Tabellenverzeichnis
│   ├── list-of-abbreviations.typ # Abkürzungsverzeichnis
│   ├── confidentiality-notice.typ # Sperrvermerk
│   ├── gender-notice.typ      # Genderhinweis
│   ├── bibliography.typ       # Literaturverzeichnis-Sektion
│   ├── appendix.typ           # Anhang-Sektion
│   └── statutory-declaration.typ # Eidesstattliche Erklärung
│
└── chapters/                   # Hauptkapitel der Arbeit
    ├── 01-einleitung.typ      # Kapitel 1: Einleitung
    ├── 02-grundlagen.typ      # Kapitel 2: Grundlagen
    └── 03-fazit.typ           # Kapitel 3: Fazit
```

## 🔧 Anpassung für eigene Arbeit

### 1. Metadaten ändern (`config/meta.typ`)

```typst
#let document_meta = (
  title: "Ihr Titel hier",
  subtitle: "Ihr Untertitel hier",
  authors: (
    (name: "Ihr Name", matricle: "Ihre Matrikelnummer"),
  ),
  supervisor: "Prof. Dr. Name des Betreuers",
  // ... weitere Angaben
)
```

### 2. Eigene Inhalte erstellen

**Kapitel hinzufügen/ändern:**
1. Neue `.typ`-Datei in `chapters/` erstellen
2. In `content.typ` mit `#include "chapters/neue-datei.typ"` einbinden

**Beispiel neues Kapitel (`chapters/04-methodik.typ`):**
```typst
#import "../config/abbreviations.typ": abbreviations_entries
#import "../config/citations.typ": vgl
#import "../dependencies.typ": *

= Methodik

Hier steht der Inhalt Ihres Kapitels...

== Unterkapitel

Weitere Inhalte mit Zitationen#vgl("autor2024") und Abkürzungen wie @api.
```

### 3. Literatur verwalten (`bibliography.bib`)

```bibtex
@article{autor2024,
  author = {Nachname, Vorname},
  title = {Titel der Publikation},
  journal = {Name der Zeitschrift},
  year = {2024},
  pages = {123-456},
}
```

### 4. Abkürzungen hinzufügen (`config/abbreviations.typ`)

```typst
(
  key: "api",
  short: "API",
  long: "Application Programming Interface",
),
```

**Verwendung im Text:** `@api` → wird automatisch formatiert

## 📝 Formatierungsrichtlinien

### Überschriften
- **Kapitel (h1):** `= Kapitelname`
- **Abschnitt (h2):** `== Abschnittsname`
- **Unterabschnitt (h3):** `=== Unterabschnittsname`

### Zitationen
```typst
#import "../config/citations.typ": vgl

// Normale Zitation
#vgl("schluessel2024")

// Mit Seitenzahl
#vgl("schluessel2024", page: "123")

// Mit Seitenbereich
#vgl("schluessel2024", page: "123-125")
```

### Abbildungen
```typst
#figure(
  image("pfad/zur/abbildung.png", width: 80%),
  caption: [Beschreibung der Abbildung],
)
```

### Tabellen
```typst
#figure(
  table(
    columns: 3,
    [Spalte 1], [Spalte 2], [Spalte 3],
    [Daten 1], [Daten 2], [Daten 3],
  ),
  caption: [Beschreibung der Tabelle],
)
```

## 🎨 Design-Features

- **Automatische Seitennummerierung:** Römisch (I, II, III) für Vorspann, Arabisch (1, 2, 3) für Hauptteil, Kleinrömisch (i, ii, iii) für Anhang
- **Dynamische Kopfzeilen:** Zeigen aktuelles Kapitel und Autorennamen
- **Einheitliches Design:** Alle Abschnitte verwenden konsistente Formatierung
- **Abkürzungsverzeichnis:** Automatische Generierung mit korrekter Formatierung
- **Literaturverzeichnis:** APA 6. Edition Stil
- **Modularer Aufbau:** Einfach erweiterbar und anpassbar

## 🔨 Kompilierung

### Lokale Kompilierung
```bash
# Einmalige Kompilierung
typst compile main.typ

# Automatische Neukompilierung bei Änderungen
typst watch main.typ
```

### Online (Typst Web App)
1. Projekt auf [typst.app](https://typst.app) hochladen
2. `main.typ` als Hauptdatei festlegen
3. Automatische Kompilierung bei Änderungen

## 📋 Checkliste vor Abgabe

- [ ] Metadaten vollständig ausgefüllt
- [ ] Alle Kapitel geschrieben und eingebunden
- [ ] Literaturverzeichnis vollständig
- [ ] Abkürzungsverzeichnis aktuell
- [ ] Abbildungs- und Tabellenverzeichnis korrekt
- [ ] Sperrvermerk/Vertraulichkeitshinweis falls erforderlich
- [ ] Genderhinweis angepasst
- [ ] Eidesstattliche Erklärung ausgefüllt
- [ ] PDF generiert und geprüft

## 🆘 Häufige Probleme

**Problem:** Abkürzung wird nicht gefunden
**Lösung:** Prüfen Sie die Schreibweise in `config/abbreviations.typ` und verwenden Sie `@schluessel` ohne Bindestriche

**Problem:** Zitation funktioniert nicht
**Lösung:** Überprüfen Sie den Schlüssel in `bibliography.bib` und die Syntax `#vgl("schluessel")`

**Problem:** Kompilierungsfehler
**Lösung:** Prüfen Sie die Typst-Syntax und fehlende Imports

## 📞 Support

Bei Fragen zur Vorlage oder Typst allgemein:
- [Typst Dokumentation](https://typst.app/docs/)