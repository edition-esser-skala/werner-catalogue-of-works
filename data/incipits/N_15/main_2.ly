\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/2 \tempoMarkup "Largo"
    \partial 2 h'2^\partVi
  e,1 fis2
  g1 a2
  g e fis
  e1 e'2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
