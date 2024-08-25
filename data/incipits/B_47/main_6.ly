\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
  e'1^\partSc g2
  e d r4 c
  c2 f r4 f
  d2 g e
}

text = \lyricmode {
  A -- gnus
  De -- i, qui
  tol -- lis pec --
  ca -- ta, "pec -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
