#import "config/settings.typ": author, document_subtitle, document_title, location, submission_date

= Eidesstattliche Erklärung

Hiermit versiche ich, dass ich vorliegende Arbeit mit dem Titel

#let full_name = if document_subtitle == none or document_subtitle == "" {
  document_title
} else {
  [#document_title  -- #document_subtitle]
}

#text(style: "italic")[#full_name]

in allen Teilen selbstständig und ohne unzulässige fremde Hilfe verfasst habe, dass ich keine anderen als die in der Arbeit angegebenen Quellen und Hilfsmittel, insbesondere keine KI-Software, benutzt habe, und dass ich die stellen der Arbeit, die ich anderen Werken - auch elektronischen Medien - dem Wortlaut oder Sinn nach entnommen habe, in jedem Fall unter Angabe der Quelle als Entlehnung kenntlich gemacht habe.
\
\
#text()[#location], den #text()[#submission_date.display("[day].[month].[year]")]
#image("assets/unterschrift.png", width: 40%)
#line(length: 40%)
#text()[Max Mustermann]
