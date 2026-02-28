\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  e2^\partAc f e
  d4 g2 f4 g2
  \clef soprano a2^\partSc c h
  a4 d2 c4 d2
}

text = \lyricmode {
  Pan -- ge, lin --
  gua, glo -- ri -- o --
  Pan -- ge, lin --
  gua, glo -- ri -- "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
