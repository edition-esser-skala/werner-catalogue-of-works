\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/4 \tempoMarkup "Cantabile"
  c'4.^\partVi d16 e d4
  g8( g,) \grace g f2
  e4 e'2
  d8 e \grace d c2\trill %115
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
