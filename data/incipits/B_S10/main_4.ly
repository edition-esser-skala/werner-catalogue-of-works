\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  e'1^\partSc e2
  d d h
  h1 h2
  g h c
  h1 h2
}

text = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem,
  fa -- cto -- rem
  coe -- li
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
