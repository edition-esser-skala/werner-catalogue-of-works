\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 2/4 \tempoMarkup "Vivace" \autoBeamOff
  g'8^\partSs d4 g8
  h g4 h8
  d g d h
  g16[ d e fis] g[ a h c]
}

text = \lyricmode {
  Sal -- ve Re --
  gi -- na, ma --
  ter mi -- se -- ri --
  cor -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
