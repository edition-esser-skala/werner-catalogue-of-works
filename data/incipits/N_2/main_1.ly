\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "Vivace"
  \partial 8 a'8^\partVi d fis16 d a'8 e16 cis d4 r8 a
  d16( e) fis( d) a'( h) e,( cis) d( d,) fis'( d,) e'( d,) fis'( d,)
  d'( d,) g'( d,) e'( d,) fis'( d,) d'( d,) fis'( d,) e'( d,) fis'( d,)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
