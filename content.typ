#import "config/settings.typ": *

#let chapters = (
  "01_Einleitung",
  "02_Hintergrund",
  "03_Methodik",
  "04_Ergebnisse",
  "05_Diskussion",
  "06_Fazit",
)

#counter(page).update(1)
#set page(
  numbering: "1",
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
      text(weight: "regular")[#left_side], text(weight: "regular")[#counter(page).display("1")],
    )
  },
)

#set text(size: 12pt)

#set par(
  spacing: line_height.main * 1em,
  leading: line_height.main * 0.65em,
  justify: true,
)

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(0.65em)
  text(
    size: heading_sizes.h1,
    weight: "extrabold",
  )[#it]
  v(0.65em)
}
#show heading.where(level: 2): it => {
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

#for chapter in chapters {
  include "chapters/" + chapter + ".typ"
}
