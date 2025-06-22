\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Andante"
  d'8^\partVi d, d fis16 a, d8 a'16 fis d8 fis16 a,
  d8 a'16 fis d8 fis16 a, \sbOn \tuplet 3/2 8 { d e d } a' fis \tuplet 3/2 8 { d e d } fis a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
