\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Lucifer" d a16 a a h g8 g16 g h h h c
  d8 d d16 d f e c8 c r e
  a, a h c c g r4
}

text = \lyricmode {
  Nun iſt mein Neyd ge -- ſtil -- let, weil ich mein fin -- ſters
  Reich ſo woll be -- ſe -- tzet ſe -- he, und
  zahl -- reich an -- ge -- fül -- let. Hier
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
