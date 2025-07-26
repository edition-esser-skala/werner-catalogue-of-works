\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/2 \tempoMarkup "Vivace"
  c'2^\partOrg c, c'
  h1 g2
  c c, c'
  h1 g2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
