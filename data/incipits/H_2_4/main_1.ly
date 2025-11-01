\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  e'8^\partSc d e g e c r4
  e8 e16 e f8 f16 f f8. e16 e4
  c8 c c d e d d4
  c
}

text = \lyricmode {
  Lau -- da, lau -- da, lau -- da,
  lau -- da Ie -- ru -- sa -- lem, Do -- mi -- num,
  lau -- da De -- um tu -- um, Si --
  on.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
