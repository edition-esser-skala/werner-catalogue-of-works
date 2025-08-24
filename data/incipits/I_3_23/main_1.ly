\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "Allegro moderato" \autoBeamOff
  c'2^\partSc c h
  c c d
  e f d
  c d h
  c
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- _ _
  re,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
