\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  \mvTrr g'8.[\trill^\part "S 1 solo" a16] \sbOn \tuplet 3/2 8 { h[\trill a h c\trill h c] } \sbOff d8 h16[ c] d8.[\trill e32 fis]
  g8 g, r4 r2
}

text = \lyricmode {
  Al -- _ _ ma Ma --
  _ ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
