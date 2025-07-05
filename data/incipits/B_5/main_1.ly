\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  c'8^\partSc c d d e e r4
  d8 d d d d d r4
  a8. a16 d8 c h h c d
  g,4
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son,
  Ky -- ri -- e e -- lei -- son, Ky -- ri --
  e,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
