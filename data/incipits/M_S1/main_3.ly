\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \dorian \time 4/4 \tempoMarkup "Presto"
  d'2^\partVii cis8 a4 c8
  h g4 b8 a d, d' c
  b a16 b c8 b16 c d4 h
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
