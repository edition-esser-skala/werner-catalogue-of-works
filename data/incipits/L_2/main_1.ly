\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
  g''4^\partVi g
  g8. h32 a g8 d
  e d e fis
  g8. h32 a g8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
