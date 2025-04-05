\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/8 \tempoMarkup "Allegro"
  d8^\partVi \tuplet 3/2 8 { fis16 e d } d'8~
  d cis h
  a \tuplet 3/2 8 { cis16 h a } g'8~
  g fis e
  fis d a'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
