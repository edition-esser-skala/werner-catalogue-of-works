\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  e'4^\partSc e8 e d c d h
  e4 e r2
  e4 e8 e d c d h
}

text = \lyricmode {
  Glo -- ri -- a in ex -- cel -- sis
  De -- o,
  glo -- ri -- a in ex -- cel -- sis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
