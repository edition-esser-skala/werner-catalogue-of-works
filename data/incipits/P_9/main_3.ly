\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/8 \tempoMarkup "Allegro assai"
  d'4.~^\partVi
  d16 g fis8 e
  d16( c') h8 a
  g4 r8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
