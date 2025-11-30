\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Larghetto"
  c2.~^\partOrg
  c4 h2
  c2.
  g2 r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
