\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/4 \tempoMarkup "Larghetto"
    \once \override Staff.TimeSignature.style = #'single-digit
  h'8.^\partVi c32 d a4 r8 d
  h g'16( fis) g4\trill r8 d
  e16( fis) g8 g32( fis16.) fis32( e16.) e32( d16.) d32( c16.)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
