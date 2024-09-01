\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r8^\partSc e'4 d8 e4 r8 e
  d d r4 r8 d d4
  e8 e d4 e r
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
