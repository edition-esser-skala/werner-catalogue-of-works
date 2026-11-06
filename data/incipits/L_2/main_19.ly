\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schnepfendrekh" a a16 a d a fis8. fis16 fis8 fis
  a8. a16 a8 h g8. g16 g4
}

text = \lyricmode {
  Wälß mi den all zum Rich -- ter wolt, ſo
  merkh I daß I fol -- gen ſolt,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
