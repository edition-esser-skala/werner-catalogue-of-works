\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Allegro"
  g'8^\partVii g g fis16 e fis8 d fis a
  c c c h16 a h c h a g h a g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
