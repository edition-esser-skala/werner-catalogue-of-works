\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
  f16[^\partAs g a b] c8 a16[ g] f[ e] f8 r c'
  d8.[ c32 b] a8[ g] f4 r8 g
  \sbOn \tuplet 3/2 8 { a16[ b a } g f] \sbOff c'8 b16[ a] g4 r8 f
}

text = \lyricmode {
  Be -- _ ne -- di -- ctus, qui
  ve -- _ nit in
  no -- _ mi -- ne, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
