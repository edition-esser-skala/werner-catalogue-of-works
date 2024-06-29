\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \key a \major \time 3/8 \tempoMarkup "Allegro"
  a'8^\partVi a( h)
  cis cis( d)
  e fis gis
  a a, r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
