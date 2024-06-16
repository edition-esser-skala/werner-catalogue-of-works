\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "Larghetto"
  r8^\partVi a'' a a, a4
  r8 b' b b, b4
  r8 c' c c, d f,
  f( e) e4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
