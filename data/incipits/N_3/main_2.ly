\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Larghetto"
  h''8(^\partVi c) h( a) g( fis) \noBreak
  g2 r4
  fis,8( g) a4 g
  g8( fis) fis4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
