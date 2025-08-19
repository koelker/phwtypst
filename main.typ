#import "frontmatter.typ": frontmatter
#import "config/dependencies.typ": *
#import "config/acronyms.typ": acronym-entries
#import "config/settings.typ": document_language, font_family, page_margins
#import "@preview/glossarium:0.5.8": count-all-refs, count-refs

#set text(lang: document_language, font: font_family)

#set page(
  margin: (
    top: page_margins.top,
    left: page_margins.left,
    right: page_margins.right,
    bottom: page_margins.bottom,
  ),
)

#set math.equation(numbering: "(1)")

#show figure.caption: emph

#show: make-glossary
#register-glossary(acronym-entries)

#show: codly-init.with()

#show outline.entry.where(
  level: 1,
): it => {
  set block(above: 1.2em)

  it
}

#frontmatter(
  hide-abstract: false,
  hide-acknowledgement: false,
  hide-gender-notice: false,
  hide-list-of-acronyms: false,
  hide-list-of-figures: false,
  hide-list-of-tables: false,
  hide-list-of-listings: false,
  hide-list-of-equations: false,
  acronym-entries: acronym-entries,
)

#include "content.typ"

#include "config/bibliography.typ"

#pagebreak(weak: true)

#include "appendix.typ"
