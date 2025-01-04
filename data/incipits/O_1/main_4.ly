\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 2/4 \tempoMarkup "Allegro"
  \partial 4 c'8^\partVi e
  a,[ f' e d]
  e c c'8. h32 a %140
  g8. f16 e8.\trill d32 c
  g4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
