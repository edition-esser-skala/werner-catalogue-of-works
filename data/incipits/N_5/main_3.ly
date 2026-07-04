\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key d \major \time 2/4 \tempoMarkup "Allegro"
  d8^\partVi a16 d fis8 d16 fis
  a8 r d r
  fis, d16 fis a8 fis16 a
  d8 r fis r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
