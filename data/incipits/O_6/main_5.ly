\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/8 \tempoMarkup "Allegro assai"
  g'16^\partVi a h8 cis
  d e fis
  g h, cis %130
  d4 r8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
