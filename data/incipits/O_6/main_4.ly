\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/4 \tempoMarkup "[no tempo]"
  h'8(^\partVi cis) d( \hA cis) d4
  d,2.\trill
  e'8( fis) g( fis) g4
  g,2.\trill
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
