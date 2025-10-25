\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partVii a'4.\f b16 c
  g4 c,4. d16 e \gotoBar "10"
  \clef soprano \autoBeamOff
    r4^\partSs a4. \tuplet 3/2 8 { c16[ b a] }
  g8[ c,] c'4.~ \tuplet 3/2 8 { c16[ d e] }
}

text = \lyricmode {
  \skips 7
  Wer Ma --
  ri -- am __
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
