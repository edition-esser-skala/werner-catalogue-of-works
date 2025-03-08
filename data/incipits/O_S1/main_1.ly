\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key d \major \time 2/4 \tempoMarkup "La Simplicita"
  \partial 8 d'16^\partVi e
  fis8 e16 d fis8 a
  e4 a,
  fis8 e16 d fis8 a
  e4 a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
