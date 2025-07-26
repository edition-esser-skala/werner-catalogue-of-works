\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Vivace"
  r8^\partVi d''16. a32 f8. a32( f) d8. f32( d)
  a8 f'16.( d32) a8. d32( a) f8. a32( f)
  d8 f'16 g a32( g f g) a8 a32( g f g) a8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
