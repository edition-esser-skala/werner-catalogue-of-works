\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Larghetto"
  d'2~^\partVi d8. f16
  b,2~ b8. d16
  cis,2.~
  cis8 d d4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
