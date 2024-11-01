\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Allegro"
  \partial 8 r8^\partOrg c4 r c r8 c'
  g4 g,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
