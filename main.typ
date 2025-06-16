#import "cover.typ": cover
#import "config/meta.typ": document_meta, page_margins, colors, typography, get_author_names
#import "config/abbreviations.typ": abbreviations_entries
#import "config/citations.typ": vgl

#import "sections/table-of-contents.typ": table_of_contents
#import "sections/abstract.typ": abstract_page
#import "sections/list-of-figures.typ": list_of_figures
#import "sections/list-of-tables.typ": list_of_tables
#import "sections/list-of-abbreviations.typ": list_of_abbreviations
#import "sections/statutory-declaration.typ": statutory_declaration
#import "sections/appendix.typ": appendix
#import "sections/confidentiality-notice.typ": confidentiality-notice
#import "sections/gender-notice.typ": gender-notice
#import "sections/bibliography.typ": bibliography_section

#import "dependencies.typ": *

#show: make-glossary
#register-glossary(abbreviations_entries)

// Style abbreviations: short form bold, long form regular
#show figure.where(kind: "jkrb_glossarium"): it => {
  show strong: text.with(weight: "bold")
  show emph: text.with(style: "normal", weight: "regular")
  it
}

#cover(
  title: document_meta.title,
  subtitle: document_meta.subtitle,
  authors: document_meta.authors,
  submission_date: document_meta.submission_date,
  study_year: document_meta.study_year,
  institution: document_meta.institution,
  course: document_meta.course,
  supervisor: document_meta.supervisor,
  location: document_meta.location,
)

#table_of_contents()

#confidentiality-notice()
#gender-notice()

// Uncomment if needed
#abstract_page(
  content: [
    #lorem(50)
  ],
)

#list_of_figures()
#list_of_tables()
#list_of_abbreviations()

#include "content.typ"

#bibliography_section()

#appendix()

#statutory_declaration()
