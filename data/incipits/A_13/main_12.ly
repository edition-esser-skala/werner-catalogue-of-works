\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" f, f16 f b f d8 d g16 g b g
  fis8 fis16 d a' \hA fis d a' b4 r8 \hA b
  f c es8. es16 d4 r8 f
}

text = \lyricmode {
  Da -- mit dan al -- le Weld ver -- neh -- me und er --
  fah -- re, daß ich ohn -- end -- lich grecht, doch
  auch barm -- her -- zig ſey, ſo
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
