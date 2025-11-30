\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  d2.^\partOrg e4 f2 d
  r g1 f2
  e f c d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
