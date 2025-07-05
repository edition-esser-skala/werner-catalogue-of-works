\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
  c'4^\partSc e d4. d8
  e4 r8 e e8. d16 d4
  e r d r
}

text = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus,
  pax, pax,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
