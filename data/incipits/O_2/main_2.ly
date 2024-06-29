\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key a \minor \time 2/4 \tempoMarkup "Allegro"
  a'8^\partVi c16 h a4~
  a8 c16 h a8 c
  h16 c d8~ d16 c c h
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
