\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 3/2 \tempoMarkup "Andante"
  g2^\partOrg g' fis
  e1 h2
  c d d,
  g1 r2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
