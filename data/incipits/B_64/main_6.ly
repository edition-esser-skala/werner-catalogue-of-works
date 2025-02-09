\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  r8^\partBs f4 g8 a4. b16 c
  e,4 e8. f16 f4 f
  r8 c' a f d4 d
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta,
  pec -- ca -- ta mun -- di:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
