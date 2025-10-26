\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/8 \tempoMarkup "Allegro"
  \partial 8 a'8^\partVi d fis d
  a' h a
  fis d e
  a,4 a,8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
