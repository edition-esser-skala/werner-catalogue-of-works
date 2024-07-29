\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Allegro"
  c2^\partOrg h4
  c e c
  d g, c
  c d e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
