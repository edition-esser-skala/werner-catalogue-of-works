\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 2/4 \tempoMarkup "Andantino"
  a'16^\partVi c f8 c16 f a8
  b2
  b16 g e8 g16 e b8~
  b a16 g a4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
