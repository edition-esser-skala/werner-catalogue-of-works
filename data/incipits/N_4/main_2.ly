\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/2 \tempoMarkup "Larghetto" \newSpacingSection
  d2~^\partVi d8 e f4 f8 e d4
  e8 d e4 cis8 h \hA cis4 a2
  d'2~ d8 e f4 f8 e d4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
