\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  d1^\partOrg c
  b a2 a'
  g1 f2 a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
