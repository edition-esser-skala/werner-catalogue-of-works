\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/2 \tempoMarkup "Largo"
  g'2^\partVi b d
  g4 b8 a g1~
  g2 \gotoBar "18"
  \clef alto b,,1^\partAc
  c2 d es
  d b c
}

text = \lyricmode {
  \skips 7
  Ve --
  xil -- _ la
  re -- _ gis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
