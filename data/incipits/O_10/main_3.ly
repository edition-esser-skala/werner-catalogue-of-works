\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/4 \tempoMarkup "[no tempo]"
  d'8^\partVi es f2
  f8( es) d4 c
  b r r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
