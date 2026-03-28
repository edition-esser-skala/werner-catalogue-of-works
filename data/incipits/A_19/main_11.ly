\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Largo"
  \partial 8 f8^\partVi \sbOn b32 c d es f16 b, \appoggiatura b8 a8.\trill b16 \tuplet 3/2 8 { b\trill a b b\trill a b b[\trill a b] } \sbOff
    \gotoBar "6" \clef bass \autoBeamOff f,8^\part "Barak"
  d64[ c b16.] b'8 a64[ g f16.] f16[ es] d[ es] f[ a,] b8 f'
}

text = \lyricmode {
  \skips 18
  Waß
  weicht dem ſcharf -- fen Son -- nen -- liecht und
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
