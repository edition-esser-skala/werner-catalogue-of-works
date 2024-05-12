\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  c'2^\partSc c4 e c g
  c4. c8 c4 g c2~
  c4 a f2. f4
}

text = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, cre -- a --
  tor Spi -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
