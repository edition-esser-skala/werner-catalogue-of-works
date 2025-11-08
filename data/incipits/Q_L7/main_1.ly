\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
  \partial 8 g'8^\part "b [?]" d'16( h) a( g) g8 g d'16( h) a( g) g8 g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
