\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" f, d16 f b f g8 g16 g f c es f
  d8 \clef tenor f^\part "Gerechtigkeit" b d fis,[ a] c4
  b16[ a] \hA b8 r d h d f! d
}

text = \lyricmode {
  Man hör dem -- nach mit Züt -- tern den Schlus deß
  Ur -- theils an. Nun -- mehr ô fro -- me
  Her -- tzen zer -- flüeſt in bütt -- ren
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
