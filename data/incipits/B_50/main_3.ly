\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  c'2^\partSc g4. g8
  a4 a h2
  c4 r r8 c e c
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem, fa -- cto -- rem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
