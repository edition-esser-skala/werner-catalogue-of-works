\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
  a'8^\partVi c e4 gis
  a a, r
  c' h8 a g! f
  e4 d r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
