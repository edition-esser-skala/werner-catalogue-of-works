\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \tempoMarkup "Vivace"
    \set Staff.timeSignatureFraction = 2/2
  d1.^\partOrg c2
  f1 e
  d2 a4 b c1~
  c~ c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
