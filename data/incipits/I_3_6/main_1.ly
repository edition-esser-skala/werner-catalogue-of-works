\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Andante"
  r4^\part "clno" r8 g' c16 d e f \tuplet 3/2 8 { \sbOn g a g f e d  \sbOff }
  e8 c r g' \gotoBar "6" \clef soprano \autoBeamOff r8^\partSs g, c e
  a, f'16 d h8 a16 h c[ d e f] \sbOn \tuplet 3/2 8 { g[ a g f e d] } \sbOff
    e8 c
}

text = \lyricmode {
  \skips 14
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae -- ta -- _
  _ re,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
