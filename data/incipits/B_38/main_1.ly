\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Vivace"
  \sbOn c''16.^\partVi c,32 c d64 e f g a h c16. c,32 c d64 e f g a h \sbOff c16. c,32 c8 r16 g c e \gotoBar "9"
  \clef soprano \autoBeamOff c8.^\partSc e16 d8 d e e r c
    c4 d2 e4~ %10
}

text = \lyricmode {
  \skips 24
  Ky -- ri -- e e -- lei -- son, e --
  lei -- _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
