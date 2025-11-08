\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Adagio"
  h'16^\partVi c d es f g as h, c8 g c,4
  a'16 b c d es f g a, b8 f b,4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
