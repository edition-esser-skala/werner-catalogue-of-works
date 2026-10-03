\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d d a' b a \bar "||"
  \clef tenor \time 4/2 \tempoMarkup "Allabreve"
    \set Staff.timeSignatureFraction = 2/2
  c1^\partTc a2 d~
  d c b2. b4
  a2 d g, c
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe -- li, coe --
  li de -- su --
  per, coe -- li "de -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
