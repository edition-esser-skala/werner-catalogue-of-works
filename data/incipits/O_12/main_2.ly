\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "Allegro"
  f'8.[^\partVi c16 a8. f16 a8. c16]
  f8.[ c16 a8. f16 a8. c16]
  f8 a16 g f8 e16 d c8. b16
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
