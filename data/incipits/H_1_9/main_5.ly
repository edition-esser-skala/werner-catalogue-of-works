\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  a1^\partBc e4 f e d
  c h a1 gis2 \gotoBar "4"
  \clef soprano r1^\partSc r2 e'''
  a,4 c h a g fis e2
}

text = \lyricmode {
  Lau -- da -- _ te _
  Do -- _ _ "mi -"
  Lau --
  da -- _ te _ Do _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
