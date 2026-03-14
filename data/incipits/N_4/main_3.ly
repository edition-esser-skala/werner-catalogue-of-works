\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
    \partial 8 a'8^\partVi d e fis gis
  a4 h8 gis16 e
  a8 r h, gis16 e
  a4 r8 a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
