\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "[no tempo]"
  d'2.^\partVi
  fis16([ e8.) d16( cis8.) h16( a8.)] %60
  g4~ \tuplet 3/2 4 { g8 a h } a g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
