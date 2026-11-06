\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Largo"
  d'2^\partVi c
  b4. \tuplet 3/2 8 { es16 d c } b8. c16 a4
  g8 b c16 d d es es2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
