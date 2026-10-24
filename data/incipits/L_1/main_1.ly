\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 12/8 \tempoMarkup "Allegro"
  \partial 8 c'8^\partVi f f f f f f f f f f f f
  g g g g g g a16 b c b a g f8 g a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
