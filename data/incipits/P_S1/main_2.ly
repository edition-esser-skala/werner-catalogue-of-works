\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Allegro"
  g'2^\partVii es'
  fis, d'
  e, c'
  d,4 b' a2
  g8 b a g f4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
