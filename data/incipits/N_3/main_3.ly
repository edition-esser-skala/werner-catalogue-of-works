\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/8 \tempoMarkup "Allegro assai"
  h'16^\partVi c d8. g16
  h, c d8. g16
  fis g a h c8
  h a r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
