\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Andante non troppo"
  d'4.^\partVi g16 g, g8 fis r fis'
  g16 f32 es d16 c b8 a16. g32 g4 r
  a'8.\trill g32 a b16 b, es8 es d r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
