\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
  d'16(^\partVi a) a4.
  h16( g) a4.
  g'16( e) a,4 g'16( e)
  fis8 d, r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
