\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
    \set Staff.timeSignatureFraction = 2/2
  h'1^\partSc c
  h2. h4 e2 d~
  d cis dis e
  fis1. e2
}

text = \lyricmode {
  A -- gnus
  De -- i, qui tol --
  _ lis pec --
  ca -- ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
