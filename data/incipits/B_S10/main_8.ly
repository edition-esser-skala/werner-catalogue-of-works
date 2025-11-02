\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twotwotime \key c \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'4.^\partSc c8 c4 c8 c
  d4 d8 d d4 c
  c2 h
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
