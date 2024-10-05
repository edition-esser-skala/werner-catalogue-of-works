\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/8 \tempoMarkup "Allegro"
  \tuplet 3/2 8 { c'16^\partVi c c e[ e e] g g g c[ c c]
  h h h g[ g g] e e e c[ c c]
  h h h g[ g g] e e e c[ c c] }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
