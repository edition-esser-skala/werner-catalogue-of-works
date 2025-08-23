\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/2 \tempoMarkup "Vivace" \autoBeamOff
  \partial 4 g'4^\partSc c2 g'
  e c
  d h
  c
}

text = \lyricmode {
  Ehr ſey Gott
  in dem
  höch -- ſten
  Thron,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
