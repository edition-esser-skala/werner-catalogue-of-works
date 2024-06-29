\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/8 \tempoMarkup "[no tempo]"
  e'8^\partVi a, h
  cis16 h cis8 d
  e a, h
  cis16 h cis8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
