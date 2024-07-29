\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "[no tempo]"
  R1*8
  g''4^\partUnk \tuplet 3/2 8 { d'16 c h a[ g f] } e8 c r4
  g' \tuplet 3/2 8 { d'16 c h a[ g f] } e8 c r c
  \tuplet 3/2 8 { d16[ h c] d e fis } fis8. g16 g,4 r8 c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
