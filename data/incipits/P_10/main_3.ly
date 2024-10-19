\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Allegro"
  f'2^\partVi g16 a b4 d,8
  e2 f16 g a4 c,8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
