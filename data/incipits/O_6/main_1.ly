\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 2/4 \tempoMarkup "Allegro"
  g'16^\partVi g h h d d g g
  h4 d
  r8 c[ d, c']
  h16 h g g d d h8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
