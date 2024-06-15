\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key g \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
  g'1^\partSc
  h2 d
  e d
  c1
  h2 c
}

text = \lyricmode {
  Sal --
  ve Re --
  gi -- na,
  sal --
  ve "ma -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
