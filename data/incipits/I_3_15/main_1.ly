\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Andante"
  r8^\partVi c' h d c16. c32 h16 a g8 f'
  e16 c32( d e f) g16 a e d\trill c d h a\trill g g' d c\trill h \gotoBar "8"
  \clef soprano \autoBeamOff r8^\partSs c h d c[ h16 a] g8 f'
  e c r e d4. c16[ h]
}

text = \lyricmode {
  \skips 24
  Re -- gi -- na coe -- li, lae --
  ta -- re, lae -- "ta -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
