\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegro"
  f4.^\partVi g8
  a b c d
  e, f g a
  b c d e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
