\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d'8^\partSs a16[ g] fis8 e d a' g8. g16
  fis8 r r4 r2
}

text = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
