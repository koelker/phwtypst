// --- Modern Minimal Cover (compact two-column meta, no gray) -----------------
#import "../config/settings.typ": cover_font_family

#let cover(
  // Required
  title, // main title (content or string)
  // Optional
  subtitle: lorem(5),
  thesis-type: "Praxistransferbericht I",
  author: "Max Mustermann",
  program: "Wirtschaftsinformatik",
  cohort: "CS2022",
  matric-no: "123321",
  supervisors: ("Prof. Dr. Max Mustermann",), // string or array
  submission-date: "14 Aug. 2025",
  location: "Vechta",
  institution: "Private Hochschule für Wirtschaft und Technik",
  department: "Betriebswirtschaft und Informatik",
  institute: none,
  // You may pass either a path string or ready-made content like image("x.png")
  logo: "../assets/logo.jpg",
  // Style
  accent: rgb("#1c4482"),
  // Tunables (if you ever need to nudge sizes to fit)
  label-size: 9pt,
  value-size: 11pt,
  title-size: 28pt,
  subtitle-size: 13pt,
  gutter: 16mm,
) = {
  // Page-level look & feel for the cover only
  set page(numbering: none, margin: 28mm, paper: "a4")
  set text(font: cover_font_family)

  // Helper: label + value block (minimal)
  let info = (label, value, alignment) => if value == none or value == "" { [] } else {
    align(alignment)[#text(size: label-size, weight: 650, fill: luma(55))[#label]]
    align(alignment)[#text(size: value-size)[#value]]
  }

  // Normalize supervisors to a stackable content block
  let sup-list = if type(supervisors) == array { supervisors } else { (supervisors,) }
  let sup-body = if sup-list.len() == 0 { none } else { sup-list.join(linebreak()) }

  // Robust logo: accept string path or content
  let logo-block = if logo == none {
    // Placeholder: faint square with accent border
    box(width: 100%, height: 100%, stroke: (accent, 1pt), inset: 0pt)
  } else if type(logo) == content {
    logo
  } else {
    image(logo)
  }

  // --- Top accent band with logo and institution -----------------------------
  box(width: 100%, height: 30mm, fill: accent, inset: (x: 10mm, y: 6mm))[
    // Use a single-row, two-cell table to position left/right content
    #table(columns: 2, align: (left, right), column-gutter: 1fr, stroke: none)[
      // Left: logo in a white square frame
      #box(inset: 0pt)[
        #box(
          width: 24mm,
          height: 24mm,
          fill: white,
          radius: 3pt,
          inset: 3mm,
          stroke: none,
        )[
          #if logo == none {
            // Placeholder: faint square with accent border
            box(width: 100%, height: 100%, stroke: (accent, 1pt), inset: 0pt)
          } else {
            // Caller-supplied logo content (should already be square or auto-fit)
            image(logo)
          }
        ]
      ]
      ~
      // Right: institution (and optional unit lines) in white
      #box(inset: 0pt)[
        #text(white, size: 12pt, weight: 700)[#institution]
        #if department != none {
          linebreak()
          text(white, size: 10pt)[#department]
        }
        #if institute != none {
          linebreak()
          text(white, size: 10pt)[#institute]
        }
      ]

    ]
  ]

  v(12mm)

  // --- Title block ------------------------------------------------------------
  smallcaps(text(size: 11pt, weight: 650, fill: accent)[#thesis-type])
  v(3mm)
  text(size: title-size, weight: 800)[#title]
  if subtitle != none {
    v(2mm)
    text(size: subtitle-size, fill: luma(45))[#subtitle]
  }
  v(5mm)
  line(length: 100%, stroke: accent)
  v(8mm)

  // --- Minimal two-column meta information (no background) -------------------
  let details-left = [
    #info("Verfasser", author, left)
    #v(4pt)
    #info("Studiengang", program, left)
    #v(4pt)
    #info("Jahrgang", cohort, left)
    #v(4pt)
    #info("Matrikelnummer", matric-no, left)
  ]

  let details-right = [
    #info("Betreuer", sup-body, right)
    #v(4pt)
    #info("Datum der Abgabe", submission-date, right)
    #v(4pt)
    #info("Ort", location, right)
    #v(4pt)
    #info("Fachbereich", department, right)
    #v(4pt)
    #info("Institute", institute, right)
  ]

  // True side-by-side columns via one-row table
  table(
    columns: (1fr, 1fr),
    align: (left, left),
    column-gutter: gutter,
    stroke: none,
    details-left, details-right,
  )

  // Continue document on the next page
  pagebreak()
}
