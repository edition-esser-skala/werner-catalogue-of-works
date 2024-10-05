\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'1^\partSc c2
  h1 h2
  r c gis
  a1.
  gis2
}

text = \lyricmode {
  Pan -- ge
  lin -- gua
  glo -- ri --
  o --
  si
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
