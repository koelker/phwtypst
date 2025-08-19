#import "frontmatter/cover.typ": *
#import "config/dependencies.typ": *
#import "config/settings.typ": *

#let frontmatter(
  hide-abstract: false,
  hide-acknowledgement: false,
  hide-gender-notice: false,
  hide-list-of-acronyms: false,
  hide-list-of-figures: false,
  hide-list-of-tables: false,
  hide-list-of-listings: false,
  hide-list-of-equations: false,
  acronym-entries: none,
) = {
  counter(page).update(0)


  cover(
    document_title,
    subtitle: document_subtitle,
    author: author,
    submission-date: submission_date.display("[day].[month].[year]"),
    location: location,
    matric-no: matric_no,
    thesis-type: type,
    program: course,
    cohort: cohort,
    department: department,
    supervisors: (supervisor,),
  )
  pagebreak(weak: true)

  set page(
    numbering: "I",
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

  show heading.where(level: 1): it => {
    text(size: 24pt, weight: "black")[#it]
    v(1em)
  }

  set par(justify: true)

  set text(size: 12pt)

  if not hide-abstract {
    heading(level: 1)[Abstract]
    include "frontmatter/abstract.typ"
    pagebreak(weak: true)
  }

  if not hide-acknowledgement {
    heading(level: 1)[Danksagung]
    include "frontmatter/acknowledgement.typ"
    pagebreak(weak: true)
  }

  if not hide-gender-notice {
    heading(level: 1)[Hinweis zur gendergerechten Sprache]
    include "frontmatter/gender-notice.typ"
    pagebreak(weak: true)
  }

  heading(level: 1)[Inhaltsverzeichnis]

  show outline.entry.where(
    level: 1,
  ): set text(weight: "semibold")

  outline(title: none)
  pagebreak(weak: true)

  show outline.entry.where(
    level: 1,
  ): set text(weight: "regular")

  context {
    if not hide-list-of-acronyms and count-all-refs(entry-list: acronym-entries).map(t => t.at(1)).sum() > 0 {
      heading(level: 1)[Abkürzungsverzeichnis]
    }
    print-glossary(
      acronym-entries,
      disable-back-references: true,
    )
    pagebreak(weak: true)
  }

  context {
    if not hide-list-of-figures and query(figure.where(kind: image)).len() > 0 {
      heading(level: 1)[Abbildungsverzeichnis]
      outline(title: none, target: figure.where(kind: image))
      pagebreak(weak: true)
    }
  }

  context {
    if not hide-list-of-tables and query(figure.where(kind: table)).len() > 0 {
      heading(level: 1)[Tabellenverzeichnis]
      outline(title: none, target: figure.where(kind: table))
      pagebreak(weak: true)
    }
  }

  context {
    if not hide-list-of-listings and query(figure.where(kind: "listing")).len() > 0 {
      heading(level: 1)[Listingverzeichnis]
      outline(title: none, target: figure.where(kind: "listing"))
      pagebreak(weak: true)
    }
  }

  context {
    if not hide-list-of-equations and query(figure.where(kind: "equation")).len() > 0 {
      heading(level: 1)[Gleichungsverzeichnis]
      outline(title: none, target: figure.where(kind: "equation"))
      pagebreak(weak: true)
    }
  }
}
