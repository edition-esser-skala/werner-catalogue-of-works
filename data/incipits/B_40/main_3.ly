\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Allegro"
  c'2^\partSc c c
  h d1
  e2 c c
  a d1
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- tem, fa --
  cto -- rem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
