\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/4 \tempoMarkup "Allegro"
  e'8.^\partVi fis32 gis a8 e cis a fis'16 gis a8
  h dis, e16 fis gis8 a cis, d16 e fis8
  gis a16 h a4. gis16 fis gis4\trill
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
