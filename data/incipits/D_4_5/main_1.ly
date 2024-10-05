\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c'1^\partSc
  a2 a
  d2. c4
  b g a b
  c2. b4
}

text = \lyricmode {
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
