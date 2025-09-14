\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  d'2^\partSc r4 h d h
  g2 h e
  r4 d d2 cis4. cis8
  d4
}

text = \lyricmode {
  Et in ter -- ra
  pax, pax, pax
  ho -- mi -- _ ni --
  bus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
