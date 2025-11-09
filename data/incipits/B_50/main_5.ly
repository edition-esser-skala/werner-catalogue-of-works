\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  c16[^\partAs f] a[ c] c,[ e] g b \tuplet 3/2 8 { a[ g f] } f8 r c
  \sbOn d16[ b' \tuplet 3/2 8 { a g f] e[ d c b a g] } \sbOff a8 c f16[ a] a c
}



text = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit, qui
  ve -- _ nit, qui ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
