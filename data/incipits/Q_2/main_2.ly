\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key a \major \time 2/4 \tempoMarkup "Allegro"
  a'8.^\partVi h16 h8. a32( h)
  cis8 a16 h cis d e8
  fis a, gis e'
  cis a16 h cis d e8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
