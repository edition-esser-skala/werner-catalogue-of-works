\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Allegro"
  c8^\partOrg e'16 d c h a g f8 d g g,
  c c'16 h a g f e d8 d'16 c h a g f
  e8 e'16 d c h a g f8 f'16 e d c h a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
