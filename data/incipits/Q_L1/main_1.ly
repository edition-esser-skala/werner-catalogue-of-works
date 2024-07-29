\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "[no tempo]"
  R1*8
  g''4.^\partUnk c8 h16 a g4 c8
  h16 a g4 c8 h16 a g8 r c
  a16( g a) h g f g a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
