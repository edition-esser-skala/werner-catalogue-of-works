\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \tempoMarkup "Allegro" \autoBeamOff
  c'2^\partSc c4
  e e e
  c2 c4
  c c c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
