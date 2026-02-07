\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  r1^\partSc d'
  c c
  c r2 e
  e d4 c h2 c
  c c c h
}

text = \lyricmode {
  A --
  gnus De --
  i, qui
  tol -- _ _ lis pec --
  ca -- ta mun \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
