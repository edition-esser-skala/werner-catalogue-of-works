\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Allegro"
  \partial 16 d'16^\partVi d16. f32 d16. c32 \grace c8 d8. d16 d16. f32 d16. c32 \grace c8 d8. f16
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
