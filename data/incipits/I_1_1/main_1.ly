\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r2^\partSc c'1 h4 a
  g2 e'1 d4 c
  h a g2 g fis
  g
}

text = \lyricmode {
  Al -- _ _
  ma Re -- dem -- _
  pto -- _ ris Ma -- _
  ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
