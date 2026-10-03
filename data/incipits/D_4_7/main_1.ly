\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d d a' b a \bar "||"
  \clef soprano \time 2/2 \tempoMarkup "[no tempo]"
    c'1^\partSc
  a2 a
  d2. c4
  b g a b
  c2. b4
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te.
  Ro --
  ra -- te
  coe -- li
  de -- su -- per et
  nu -- bes
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
