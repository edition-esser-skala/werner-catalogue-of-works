\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "[no tempo]"
  cis'8(^\partVi d) e( fis) e( dis)
  e4 e, e %75
  cis''8( a) gis( fis) e( dis)
  \grace dis e2 r4
  h'8( g) fis( e) d( cis)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
