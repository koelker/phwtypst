#import "settings.typ": (
  author, citation_style, font_family, footer_text_size, header_text_size, heading_sizes, submission_date,
)

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
      columns: (3fr, 1fr),
      align: (left, right),
      text(weight: "regular")[#chapter_name], text(weight: "regular")[#author],
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

    table(
      columns: (1fr, 1fr),
      stroke: none,
      [
        #align(left, left_side)
      ],
      [
        #align(right, counter(page).display("1"))
      ],
    )
  },
)

#show heading.where(level: 1): it => text(size: heading_sizes.h1)[#it]

= Literaturverzeichnis
#v(1em)
#bibliography(
  "../bibliography.bib",
  style: citation_style,
  title: none,
)
