\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Allegro"
  \partial 8 g''16^\partVi d g, a h c d8 g16 d g, a h c d8 h'
  h g g d d h h h'16 g
  d e fis g a8 h16 g d e fis g a8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
