\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/8 \tempoMarkup "Larghetto"
  a'8.^\partVi b16 a8
  g-! e-! r
  f16 g64( a b c) d8 f,
  f-! e-! r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
