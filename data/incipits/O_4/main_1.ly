\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 2/4 \tempoMarkup "Allegro"
  d'4^\partVi fis
  a d
  a8 fis16 g a g fis e
  d8 a fis d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
