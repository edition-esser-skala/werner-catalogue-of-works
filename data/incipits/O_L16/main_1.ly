\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "[no tempo]"
  R2.^\partUnk
  fis'8( e) e( d) d4
  R2.
  a'8( g) g( fis) fis4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
