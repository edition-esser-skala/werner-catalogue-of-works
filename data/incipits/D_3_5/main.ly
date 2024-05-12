\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/2 \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c1^\partAc g'
  e2 a1 g2
  f f e1
  \clef soprano g^\partSc c
  h2 e1 d2
}

text = \lyricmode {
  O sa --
  lu -- ta -- ris
  ho -- sti -- a,
  O sa --
  lu -- ta -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
