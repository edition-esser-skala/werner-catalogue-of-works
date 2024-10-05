\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 2/8 \tempoMarkup "Spiccato"
  f16[^\partVi a c8]
  f[ c']
  a[ f]
  c[ a]
  f16[ a c8]
  f[ c']
  a[ f]
  c[ a]
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
