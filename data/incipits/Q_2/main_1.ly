\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \major \time 3/4 \tempoMarkup "Arioso"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partVlcSolo e a~
  a gis8 fis e d
  cis4 h8( a) fis'4
  a8 e d2\trill
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
