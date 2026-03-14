\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c'1^\partSc
  f2 c
  d1
  c
  r2 f,
  c' g
}

text = \lyricmode {
  Re --
  gi -- na
  coe --
  li,
  re --
  gi -- na
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
