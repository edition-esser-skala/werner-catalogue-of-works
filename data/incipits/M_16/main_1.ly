\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "Largo e cantabile"
  cis'8(^\partVi d) e4( e8. fis32 gis)
  a8( a,) a'4( a8 e)
  fis( a) e( a,) gis( d')
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
