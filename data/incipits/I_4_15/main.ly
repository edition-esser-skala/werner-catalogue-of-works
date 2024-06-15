\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c'1^\partSc
  a2 c
  h4 c d2
  d c
  h4 g a h %5
}

text = \lyricmode {
  Sal --
  ve Re --
  gi -- _ na,
  sal -- ve
  "ma -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
