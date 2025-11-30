\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "Vivace"
  g8^\partOrg g g g g g g g
  g g g g' d h g g'
  d d d d d r r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
