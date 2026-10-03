\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  b'1^\partSc
  c2 f
  es d4 c
  d2 d
  c2. c4 %5
  b2 r
}

text = \lyricmode {
  Ro --
  ra -- te
  coe -- li, _
  coe -- li
  de -- su --
  per,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
