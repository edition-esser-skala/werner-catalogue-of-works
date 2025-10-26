\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c'2^\part "B 1 solo" c4 c
  c c,8 c' c16[ h c8] c, c'
  h16[ c d h] g[ a h g] e[ f g e] c8 g'
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, lae --
  ta -- _ _ re, "lae -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
