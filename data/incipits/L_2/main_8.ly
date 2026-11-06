\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schnepfendrekh" r16 a d d f d b8. b16 b8 a
  f4 r8 a c!16 c c c e8 c
}

text = \lyricmode {
  Nä nä auß dei -- ner Wahl wird nit viel
  drauß, der Bar -- thl -- me hats hin -- tern
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
