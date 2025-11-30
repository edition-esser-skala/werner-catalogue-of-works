\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 2/2 \tempoMarkup "Larghetto"
  f4^\partOrg a g f
  e d c b
  a f b2
  c4 g' c b
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
