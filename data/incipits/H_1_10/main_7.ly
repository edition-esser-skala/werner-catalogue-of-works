\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r4^\partSc e' e8. e,16 e8 e'
  e8. e,16 e4 e'4. e16 e
  d8 d d8. d16 d g, h d h8 g
}

text = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat a -- ni -- ma
  me -- a Do -- mi -- num, et ex -- ul -- ta -- vit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
