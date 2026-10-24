\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Arzt" e16 e a a a c f,8. f16 a8 f
  e8. e16 e8 gis h8. h16 h8 d16 c
}

text = \lyricmode {
  Hoch -- ge -- neig -- te Com -- pa -- gnie, ich glaub ihr
  hö -- ret nie daß mich je -- mand noch "ge -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
