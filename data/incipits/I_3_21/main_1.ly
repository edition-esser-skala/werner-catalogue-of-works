\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 12/8 \tempoMarkup "[no tempo]" \autoBeamOff
  c'8^\partSc c c h g h c4 c8 r r d
  e4. d c h
  a2. g8 h d g,4 g8
}

text = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le --
  lu -- ia, qui -- a, qui -- a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
