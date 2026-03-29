\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  d'2^\partSc d4
  c c b
  a a a
  b2 a4~
  a g2 %5
  fis r4
}

text = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta __
  mun -- %5
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
