\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  b'2^\partSc f'4 f
  d b r8 es d c
  d4 c8.\trill b16 b8 d c b
}

text = \lyricmode {
  Ve -- ni, cre --
  a -- tor, cre -- a -- tor
  Spi -- _ ri -- tus, men -- tes "tu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
