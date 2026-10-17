\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  g'1^\partBc e2 g
  a g4 fis g d e fis
  g2. fis4 g2 a
}

text = \lyricmode {
  Lau -- da Je --
  ru -- sa -- lem Do -- _ _ _
  _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
