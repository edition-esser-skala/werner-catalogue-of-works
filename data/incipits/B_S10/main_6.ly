\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c4.^\partBc d8 e4 e8 g
  c,4 c8 g' a4 a8 f
  d4 d8 c c8.[ d16] e[ g f e]
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit, qui ve -- nit, qui
  ve -- nit in no \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
