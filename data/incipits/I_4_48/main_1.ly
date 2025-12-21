\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
  d16[^\partBs d32 e f16 g] a[ a32 b c16 a] d[ b,32 c d16 e] f[ f32 g a16 f]
  \sbOn \tuplet 3/2 8 { b16[ a b } c d] \sbOff c[ g e c] f4 r
}

text = \lyricmode {
  Sal -- _ _ _
  _ _ ve,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
