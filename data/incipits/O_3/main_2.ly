\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/8 \tempoMarkup "Allegro"
  g''16.^\partVi f64 es d16[ c b a] %25
  g8. fis16 g a
  b16.\trill a64 b c8[-! b]-!
  b-! a-! r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
