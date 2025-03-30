\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  f4^\partSs b8[ c] d[ es]
  f4 b, \tuplet 3/2 4 { c8[ d es] }
  d4 c r8 a^\partSc
  b4 a c^\partSs
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- re, "re -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
