\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  f1~
  f2 f
  g1
  g
  g2 g
  g g
  b1~
  b2 a
}

text = \lyricmode {
  Si -- 
  cut 
  o -- 
  vis
  ad oc -- 
  ci -- si -- 
  o -- 
  nem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
