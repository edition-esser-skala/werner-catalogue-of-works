\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/4 \tempoMarkup "Larghetto"
  g''2^\partVi h8 g
  d'2 h8 g
  d2 h8 g
  d2 fis8 a
  c2 a8 fis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
