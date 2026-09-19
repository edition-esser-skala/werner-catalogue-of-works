\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  a'4.^\partBs a8 d,4 e
  cis d dis dis8 dis
  e4 f fis2
  e r
}

text = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- ta mun --
  di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
