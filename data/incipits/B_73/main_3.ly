\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/4 \tempoMarkup "[unknown]" \autoBeamOff
  r4 a'^\partSs c
  b a g
  a a r
  R2.
  r4 a c
  b a g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
