\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 6/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d d a' b a \bar "||"
  \clef soprano \time 4/2 \tempoMarkup "Alla breve"
    \set Staff.timeSignatureFraction = 2/2
    a'1^\partSc b2 gis
  a4 g f e d2 r
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe -- _ li
  de -- _ su -- _ per,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
