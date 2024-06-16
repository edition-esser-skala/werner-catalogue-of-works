\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
  f'4^\partVi c~
  c8 c' b a
  g4 c,~
  c8 b' a g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
