\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/8 \tempoMarkup "Allegro assai"
  d'4.^\partVi
  cis16( e) a,4
  g16( h) a,4
  fis'16( a) d,4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
