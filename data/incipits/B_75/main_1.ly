\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/2 \tempoMarkup "Vivace"
  c4^\partOrg d e c h g
  c d e c h g
  c d e c h c
  g4. a8 h4 a h g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
