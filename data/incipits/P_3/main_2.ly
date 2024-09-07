\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "Larghetto"
  d'2.~^\partVi
  d2 es4~
  \tuplet 3/2 4 { es8 d c d c b c b a }
  b4 g r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
