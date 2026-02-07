\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  d1^\partBc d2 c
  d a b1
  a \clef soprano a''^\partSc
  a2 g a e
  f1 e2 a~
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po -- ten --
  tem, Pa --
  trem o -- mni -- po --
  ten -- tem, "cre -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
