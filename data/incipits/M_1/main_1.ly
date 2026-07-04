\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/2 \tempoMarkup "Largo"
  d'4.^\partVi c8 b4 d, \tuplet 3/2 2 { a'4 b c
  b a g } g'2~ \tuplet 3/2 { g4 a b }
  a2~ a8 g fis4 es!8 d c4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
