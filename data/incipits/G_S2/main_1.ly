\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/2 \autoBeamOff \tempoMarkup "Adagio"
  c'2^\partSc c
  c4 r r2
  r4 e d2
  e4 r r2
}

text = \lyricmode {
  Ky -- ri --
  e
  e -- lei --
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
