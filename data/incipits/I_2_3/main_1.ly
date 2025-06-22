\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
  f2^\partSc g4 b b a
  d2 c4 f2 e4
  d2 c r4 b~
}

text = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- lo -- _ _
  _ rum, "a -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
