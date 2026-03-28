\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Barak" f a c e,16 e e f g b d c
  a8 a r f a e g a
  f d f16 f a f d8 d r16 g b g
}

text = \lyricmode {
  Nun groſ -- ſe De -- bo -- ra ſeyn dei -- nes Knech -- tes
  Pflich -- ten be -- reits zum Werk ge --
  bracht und von den Kriegs -- ge -- rich -- ten ſchon al -- les
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
