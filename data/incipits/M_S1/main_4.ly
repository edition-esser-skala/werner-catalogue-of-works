\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Presto"
  c'4.^\partVii c16 c c8 c c c
  c h16 a g f e d c8 c'4 a8~
  a d4 h e e8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
