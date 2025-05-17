\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "[no tempo]"
  a'4^\partVi \tuplet 3/2 4 { a8 h cis } h4
  \tuplet 3/2 4 { cis8 d e } \grace e d2
  cis4 d8 e fis gis
  a( e) \grace e d2
  cis4 fis2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
