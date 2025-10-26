\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Andante"
  \partial 8 a'8^\partVi d e fis g a4 fis8 d
  a'16 h a8 fis d a'4 r8 a,,
  d e fis g a4 fis8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
