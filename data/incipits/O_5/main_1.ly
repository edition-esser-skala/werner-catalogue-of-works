\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 2/4 \tempoMarkup "Allegro"
  e'8^\partVi r a r
  e r cis r
  fis4.\trill e16 d
  a'8 e r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
