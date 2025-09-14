\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  cis'8^\partSs e e, gis a4 r
  r8 a d cis h8. h16 h4
  R1
}

text = \lyricmode {
  Et in ter -- ra pax,
  pax, pax ho -- mi -- ni -- bus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
