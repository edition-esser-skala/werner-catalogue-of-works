\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 4/8 \tempoMarkup "Molto allegro"
  a'16(^\partVi cis8.) h16( d8.)
  cis16( e8.) r8 e,
  a gis16 fis e8 d
  d( cis) r e\p
  a gis16 fis e8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
