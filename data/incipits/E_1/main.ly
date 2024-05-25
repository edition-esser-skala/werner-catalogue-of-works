\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
  c'1^\partSc
  a2 a
  h h
  c1
  c2 e
}

text = \lyricmode {
  A --
  ve Ma --
  ri -- a
  kla --
  re, du
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
