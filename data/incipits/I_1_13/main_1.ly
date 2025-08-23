\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
  a'2.^\partBc a4 e2 g
  f1 e4 a, a'2~
  a g f1
  c2
}

text = \lyricmode {
  Al -- ma Re -- dem --
  pto -- ris _ Ma --
  ter, Ma --
  ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
