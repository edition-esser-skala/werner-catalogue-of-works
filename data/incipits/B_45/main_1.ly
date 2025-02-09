\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Andante moderato"
  d'8^\partV d,16. d'32 \sbOn cis16. e32 a g f e \sbOff f16 a32 g f e d c b a g f g f e d \gotoBar "3"
  cis16. a'32 f16. d32 a'8 a, \clef soprano a'4^\partSc b
  a g a2
  d, f4 g
}

text = \lyricmode {
  \skips 30
  Ky -- _
  ri -- _ e __
  _ e \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
