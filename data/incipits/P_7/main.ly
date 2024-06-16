\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key a \major \time 2/4 \tempoMarkup "Spirituoso"
  e'8^\partVi a4 cis8
  gis16( a) h8 e,4
  e,8 h'4 d8
  cis16( d) e8 a,,4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
