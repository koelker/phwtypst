// Appendix Section
#import "../config/sections.typ": appendix_section

#let appendix() = {
  appendix_section(
    "Anhang",
    [
      // Appendix content starts here
      // Include the appendix content file
      #include "../appendix-content.typ"
    ],
  )
}
