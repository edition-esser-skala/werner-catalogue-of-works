\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allegro"
    \set Staff.timeSignatureFraction = 2/2
  c'1 a2 d~
  d4 c f1 e2
  f1
}

text = \lyricmode {
  Coe -- li, coe --
  li de -- su --
  per
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
