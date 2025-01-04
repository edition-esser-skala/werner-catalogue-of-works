\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/8 \tempoMarkup "Allegro"
  g''8.^\partVi f32 e d16 c
  c'8 g a
  g,8. f32 e d16 c
  c'8 g a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
