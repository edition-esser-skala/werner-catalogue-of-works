\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro moderato"
  g'2^\partSc g4
  g2 g4
  a a a
  a2 a4
  a a a8 a
  h4. h8 h4
}

text = \lyricmode {
  Vi -- di
  a -- quam
  e -- gre -- di --
  en -- tem
  de tem -- plo a
  la -- te -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
