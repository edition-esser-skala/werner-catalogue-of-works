\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Presto"
  f2.^\partSs f4
  g2 f4 b
  b a g2
  f r
}



text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- _ _
  nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
