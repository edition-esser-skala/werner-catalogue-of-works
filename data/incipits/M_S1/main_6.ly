\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/4 \tempoMarkup "Presto"
  a''4.^\partVi gis8 a e fis cis
  d h e e, a16 h cis h a cis h a
  h cis d cis h d cis h cis d e d cis e d cis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
