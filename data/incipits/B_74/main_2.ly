\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Vivace"
  c4^\partOrg r r2
  r8 c e c g'4 g,
  r2 r8 e' gis e
  a4 a, r2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
