\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Spirituoso"
  a'8^\partOrg c gis e a, a'16. e32 c8 a
  d f g h, c c' h g
  c c, h g c c' e, c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
