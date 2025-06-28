\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
  h'2.^\partSs cis4 dis2
  e e dis
  cis dis e
  e dis e
}

text = \lyricmode {
  A -- _ gnus
  De -- i, qui
  tol -- lis pec --
  ca -- _ ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
