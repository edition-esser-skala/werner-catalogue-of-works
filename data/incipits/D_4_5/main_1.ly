\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/4 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/8^\partBc d d a' b a\fermata \bar "||"
  \time 2/2 \tempoMarkup "Allabreve" a2. g4
  f e \clef soprano d''2~^\partSc
  d4 c b a
  g2 c
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te
  coe -- li
  de -- su Coe --
  li de -- su --
  per, "coe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
