\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
  c'1.~^\partSc
  c~
  c~
  c~
  c~
  c~
  c
  b\trill
  a2 a d
}

text = \lyricmode {
  San --

  _
  ctus, san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
