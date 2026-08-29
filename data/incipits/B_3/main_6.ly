\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Largo"
  r2^\partTs h d
  d4 g, g2 r4 d'
  d g, g2 r4 h
  dis1 dis2
}

text = \lyricmode {
  A -- gnus
  De -- _ i, qui
  tol -- _ lis pec --
  ca -- ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
