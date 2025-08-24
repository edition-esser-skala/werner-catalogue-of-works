\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
  d'4^\partSc d8 d e d
  cis4 cis8 d e d
  cis4 cis8 a a4
  a8
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
