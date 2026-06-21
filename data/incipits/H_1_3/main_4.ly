\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro mà moderato"
  f^\partSs a c c
  a c8 c d4. d8
  c4 r c2
  c4 c d b
}

text = \lyricmode {
  Lau -- _ da -- te
  pu -- e -- ri Do -- mi --
  num: Lau --
  da -- te no -- men
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
