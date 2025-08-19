#import "@preview/glossarium:0.5.8": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#let listing(body, caption, source_name: none, source_page: none, lbl: none, hide_source: false) = {
  // Build page suffix and source line as content
  let page_ref = if source_page != none { [ , S. #source_page ] } else { [] }
  let source_line = if type(source_name) == label {
    [Quelle: #cite(source_name, form: "prose")#page_ref]
  } else if type(source_name) == str {
    [Quelle: #source_name#page_ref]
  } else {
    [Quelle: Eigene Darstellung]
  }

  // Build the figure
  let fig = figure(
    kind: "listing",
    supplement: "Listing",
    caption: caption,
  )[
    #body
  ]

  // Emit everything in one block so the label attaches to the figure
  align(center, block[
    #fig
    #if lbl != none {
      if type(lbl) == label { lbl } else { label(str(lbl)) }
    }
    #if not hide_source {
      v(-0.6em)
      text(style: "italic", align(center, source_line))
    }
  ])
}

#let abbildung(
  source,
  caption,
  alt: none,
  fit: "cover",
  format: auto,
  height: auto,
  icc: auto,
  scaling: auto,
  width: auto,
  source_name: none, // label or string or none
  source_page: none, // e.g., 10
  hide_source: false,
  lbl: none, // <label> to attach to the figure
) = {
  // Build page suffix and source line as content
  let page_ref = if source_page != none { [ , S. #source_page ] } else { [] }
  let source_line = if type(source_name) == label {
    [Quelle: #cite(source_name, form: "prose")#page_ref]
  } else if type(source_name) == str {
    [Quelle: #source_name#page_ref]
  } else {
    [Quelle: Eigene Darstellung]
  }

  // Build the figure
  let fig = figure(
    supplement: "Abbildung",
    caption: caption,
  )[
    #image(
      source,
      alt: alt,
      fit: fit,
      format: format,
      height: height,
      icc: icc,
      scaling: scaling,
      width: width,
    )
  ]

  // Emit everything in one block so the label attaches to the figure
  align(center, block[
    #fig
    #if lbl != none {
      if type(lbl) == label { lbl } else { label(str(lbl)) }
    }
    #if not hide_source {
      v(-0.6em)
      text(style: "italic", align(center, source_line))
    }
  ])
}

#let tabelle(
  ..content,
  caption,
  align_: auto,
  column-gutter: auto,
  columns: auto,
  fill: none,
  gutter: auto,
  inset: 5pt,
  row-gutter: auto,
  rows: auto,
  stroke: 1pt,
  source_name: none, // label or string or none
  source_page: none, // e.g., 10
  hide_source: false,
  lbl: none, // <label> to attach to the figure
) = {
  // Build page suffix and source line as content
  let page_ref = if source_page != none { [ , S. #source_page ] } else { [] }
  let source_line = if type(source_name) == label {
    [Quelle: #cite(source_name, form: "prose")#page_ref]
  } else if type(source_name) == str {
    [Quelle: #source_name#page_ref]
  } else {
    [Quelle: Eigene Darstellung]
  }

  let fig = figure(
    supplement: "Tabelle",
    caption: caption,
  )[
    #table(
      ..content,
      align: align_,
      column-gutter: column-gutter,
      columns: columns,
      fill: fill,
      inset: inset,
      gutter: gutter,
      row-gutter: row-gutter,
      rows: rows,
      stroke: stroke,
    )
  ]

  // Emit everything in one block so the label attaches to the figure
  align(center, block[
    #fig
    #if lbl != none {
      if type(lbl) == label { lbl } else { label(str(lbl)) }
    }
    #if not hide_source {
      v(-0.6em)
      text(style: "italic", align(center, source_line))
    }
  ])
}

#let gleichung(
  body,
  caption,
) = {
  figure(
    supplement: "Gleichung",
    kind: "equation",
    caption: caption,
  )[
    #body
  ]
}

#let anhang(fig_ref, app_ref) = {
  text()[#ref(fig_ref) in #ref(app_ref)]
}

#let vgl(key, page: none) = {
  if page != none {
    footnote([Vgl. #cite(key, form: "prose"), S. #page])
  } else {
    footnote([Vgl. #cite(key, form: "prose")])
  }
}
