\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace passato"
  e'4^\partSc r8 e d4. d8
  e4 r8 c h4. h8
  c g4 g8 a8. a16 a4
}

text = \lyricmode {
  Et in ter -- ra
  pax, in ter -- ra
  pax, pax ho -- mi -- ni -- bus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
