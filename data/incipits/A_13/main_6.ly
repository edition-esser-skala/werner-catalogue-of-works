\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schöpffer" d, a'16 a a h c8 c16 a a a c h
  g8 g r g g h g d
  e e16 e a a cis a fis8 fis r cis'
}

text = \lyricmode {
  Nun iſt es ſchon be -- ſchloſ -- ſen, ich kan mein Worth nicht
  bre -- chen, der Menſch ſoll ins Ver --
  der -- ben des bit -- tern Tod -- tes ſter -- ben, auf
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
