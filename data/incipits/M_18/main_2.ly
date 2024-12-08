\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \dorian \time 2/2 \tempoMarkup "Allabreve"
  g'1^\partVii
  d'
  es2 d4 cis
  d2 h
  c! b4 a
  b2 a4 g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
