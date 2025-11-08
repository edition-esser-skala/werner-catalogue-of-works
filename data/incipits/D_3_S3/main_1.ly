\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'1^\partSc
  a2 g
  a2. a4
  b1
  a2 a
  g1
  f2 f
}

text = \lyricmode {
  In 
  mon -- te 
  o -- li -- 
  ve -- 
  ti o -- 
  ra -- 
  vit ad
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
