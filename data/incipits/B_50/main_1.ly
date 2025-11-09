\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Vivace"
  \sbOn c''16.^\partVi c,64 d e16 \tuplet 3/2 16 { e32 d c } g'16. g,64 a h16 \tuplet 3/2 16 { h32 a g } \sbOff c16 c' c c c4 \gotoBar "10"
  \clef soprano \autoBeamOff e,4^\partSc d e r
  c h c8 g c4
}

text = \lyricmode {
  \skips 19
  Ky -- ri -- e,
  Ky -- ri -- e e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
