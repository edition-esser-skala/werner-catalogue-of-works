\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 4/4 \tempoMarkup "Larghetto"
  r8^\partOrg b' b, b' a16. b32 a16. g32 f16 es d c
  b8 d g b a, c f a
  g, b es g f b, f4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
