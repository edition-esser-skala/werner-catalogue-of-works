\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Adagiose"
  r4 a'2^\partVii g4
  \fC r^\partVi d'2 c!4
  b2 a4 a'~
  a g8 f e4 c'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
