\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "Larghetto"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partVi g' a8.\trill g32 a
  b8 c c8.\trill b32 c d8 b
  g4 \tuplet 3/2 4 { es'8 d es c b c }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
