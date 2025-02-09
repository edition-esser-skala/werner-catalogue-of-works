\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key b \major \time 2/2 \tempoMarkup "Allabreve"
  b'1^\partVi
  f'2. g8 a
  b2. a8 g
  f4 es d c
  b a g f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
