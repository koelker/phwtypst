#import "config/settings.typ": *
#import "config/dependencies.typ": *

#counter(page).update(1)
#counter(heading).update(0)
#set page(
  numbering: "i",
  header: context [
    #set text(
      font: font_family,
      size: header_text_size,
    )

    #let current_heading = query(selector(heading.where(level: 1)))
    #let here_pos = here().position()
    #let chapter_name = {
      let active_heading = none
      for h in current_heading {
        if h.location().position().page <= here_pos.page {
          active_heading = h
        } else {
          break
        }
      }
      if active_heading != none {
        active_heading.body
      } else {
        document_title
      }
    }

    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(weight: "regular")[#chapter_name], text(weight: "regular")[#document_title],
    )

    #v(-0.5em)
    #line(length: 100%, stroke: 0.5pt)
  ],
  footer: context {
    set text(
      font: font_family,
      size: footer_text_size,
    )

    let left_side = author + ", " + submission_date.display("[year]")

    grid(
      columns: (1fr, 1fr),
      align: (left, right),
      text(weight: "regular")[#left_side], text(weight: "regular")[#counter(page).display("i")],
    )
  },
)

#set text(size: 12pt)

#set par(
  spacing: line_height.main * 1em,
  leading: line_height.main * 0.65em,
  justify: true,
)

#show heading.where(level: 1): set heading(numbering: none)

#show heading.where(level: 2): set heading(outlined: false)
#show heading.where(level: 3): set heading(outlined: false)
#show heading.where(level: 4): set heading(outlined: false)

#set heading(supplement: "Anhang")

#set heading(numbering: (..nums) => {
  let num = nums.pos()
  if num.len() == 2 {
    return numbering("A", num.at(1))
  } else if num.len() >= 3 {
    return numbering("A.1", num.at(1), num.at(2))
  } else {
    return ""
  }
})


#show heading.where(level: 1): it => {
  v(0.65em)
  text(
    size: heading_sizes.h1,
    weight: "extrabold",
  )[#it]
  v(0.65em)
}

#show heading.where(level: 2): it => {
  let seen = state("seen-h2", false).get()

  if seen {
    pagebreak(weak: true)
  }

  state("seen-h2").update(true)

  v(0.45em)
  text(
    size: heading_sizes.h2,
    weight: "bold",
  )[#it]
  v(0.45em)
}
#show heading.where(level: 3): it => {
  v(0.25em)
  text(
    size: heading_sizes.h3,
    weight: "semibold",
  )[#it]
  v(0.25em)
}

= Anhang <sec:anhang>

== Listings <app:listings>

=== Python <app:python-listing>

#listing(lbl: <lst:py-daten>)[```py
import pandas as pd

# Daten laden
df = pd.read_csv("temperatur.csv", parse_dates=["timestamp"])
df = df.sort_values("timestamp").set_index("timestamp")

# Ausreißer entfernen
df = df[(df["temp_c"] >= 10) & (df["temp_c"] <= 40)]

# Lücken füllen (kurze Gaps)
df["temp_c"] = df["temp_c"].interpolate(limit=5, limit_direction="both")

# 15-Minuten-Gleitmittel
df["temp_ma15"] = df["temp_c"].rolling("15min").mean()

# Einfache 1-Schritt-Prognose (Naive Persistenz)
df["pred_naive"] = df["temp_c"].shift(1)

# RMSE
rmse = ((df["temp_c"] - df["pred_naive"])**2).mean()**0.5
print(f"Naive RMSE: {rmse:.2f} °C")

```][Python -- Einlesen, Bereinigen, Glätten]

== Abbildungen <app:abbildungen>

=== Diagramme <app:diagramme>

#abbildung(
  "../images/placeholder.png",
  lbl: <fig:liniendiagramm>,
)[Liniendiagramm Temperatur vs. Zeit (Rohrwerte und MA15)]

#pagebreak(weak: true)

#include "statutory-declaration.typ"
