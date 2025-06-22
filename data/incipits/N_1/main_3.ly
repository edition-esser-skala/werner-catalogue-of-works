\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/8 \tempoMarkup "Allegro"
  d'4.~^\partVi
  d4 \tuplet 3/2 8 { d16 e fis }
  g8 fis e
  d4 \tuplet 3/2 8 { d16 e fis }
  g8 fis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
