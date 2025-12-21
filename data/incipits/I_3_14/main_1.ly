\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  r8^\part "S 1 solo" g' c4. \tuplet 3/2 8 { h16[ c d] }
  c[ d e d] e4. \tuplet 3/2 8 { d16[ e f] }
  e[ f g f] e8 d c16[ e d f]
  e8 c
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae -- ta --
  _ re,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
