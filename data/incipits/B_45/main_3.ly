\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
  c'2.~^\partSc
  c
  a2 r4
  b b2
  a2.
  d
  c4 r r
}

text = \lyricmode {
  Cre --

  do
  in u --
  num
  De --
  um,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
