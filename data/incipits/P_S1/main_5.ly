\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/8 \tempoMarkup "Adagio · Exprimens valedictionem"
  \partial 16 es'16^\partVi \grace es8 d4 r16 es
  \grace es8 d4 r16 es
  \grace es8 d8. c16 b a
  b c b a g g'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
