\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
  b'8^\partSs f' d b f b
  d,4 r r
  b'8^\partSc d4 d8 e e
  f4 r f
}

text = \lyricmode {
  Et in ter -- ra, ter -- ra
  pax,
  pax, pax ho -- mi -- ni --
  bus "bo -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
