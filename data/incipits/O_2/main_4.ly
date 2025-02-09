\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "[no tempo]"
  a''4.^\partVi g16 fis e4
  \tuplet 3/2 4 { fis8 e d } \grace d cis2
  d4. cis16 h a8 g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
