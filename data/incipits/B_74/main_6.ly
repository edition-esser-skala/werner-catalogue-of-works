\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/2 \tempoMarkup "Largo"
  c1^\partOrg c2
  c1 c2
  h1 h2
  c1 as'2
  fis1. %5
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
