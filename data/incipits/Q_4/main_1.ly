\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Allegro"
  d'4.^\partFl g8 e d4 c16 h
  c8 h4 a16 g a8 g r4
  d'4. e8 d h a g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
