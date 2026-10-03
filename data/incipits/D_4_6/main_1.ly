\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d d a' b a \bar "||"
    \set Staff.timeSignatureFraction = 2/2
  \clef soprano \time 4/2 \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc a2 d~
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
