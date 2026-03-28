\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \key g \major \time 4/4 \tempoMarkup "Vivace"
  g16^\partVi g32 g g16 h g d' h g'32 d h16 h32 h h16 d h g' d h'32 g
  d16 d32 d d16 g d h' g d'32 h g g' g g g g g g fis16 g fis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
