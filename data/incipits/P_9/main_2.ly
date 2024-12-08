\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 4/4 \tempoMarkup "Larghetto"
  h'16(^partVi e) e4. dis16( e) e4.
  e16( c') h( a) g( fis) e( dis) dis( e) e,4.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
