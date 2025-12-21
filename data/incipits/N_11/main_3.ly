\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/8 \tempoMarkup "Andante"
  \partial 8 d8^\partVi g4 a16 h
  g8 h d16 e
  d cis a g h8
  g g, d''
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
