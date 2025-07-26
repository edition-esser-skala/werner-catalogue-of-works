\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 3/4 \tempoMarkup "Vivace"
  c'2^\partOrg g4
  e c r8 c
  g'4. g8 h g
  c4. c,8 e c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
