\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/4 \tempoMarkup "[no tempo]" \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8 d d a' b a\fermata \bar "||"
    \set Staff.timeSignatureFraction = 2/2
  \clef soprano \time 4/2
    \set Staff.timeSignatureFraction = 2/2
  c'1 a2 d~
  d4 c f1 e2
  f1 r
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe -- li, coe --
  li de -- su --
  per
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
