\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/8 \tempoMarkup "Allegro"
  a'16^\partVi h cis8 d
  e cis16 a fis'8
  e a fis
  e cis16 a fis'8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
