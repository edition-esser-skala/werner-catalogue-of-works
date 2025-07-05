\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Tempo ordinario"
  c'2.^\partSc h4 c d
  e2 e r4 e
  c2 c r4 e
  d d c1
}

text = \lyricmode {
  A -- gnus, a -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta "mun -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
