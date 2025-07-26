\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Andante"
  a8^\partOrg c16 h a8 d e c d h
  c a h gis a f' c d
  e c16 d e8 e, a c16 h a8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
