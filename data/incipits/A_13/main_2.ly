\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" f, f16 f b f d8. d16 d8 es
  f f as g es8. es16 es8 g
  g g b a f f r d
}

text = \lyricmode {
  So wird dan mei -- ne Lieb und Treu von
  den Ge -- ſchö -- pffen oh -- ne Scheu mit
  Un -- danckh nur be -- loh -- net? Eß
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
