\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/8 \tempoMarkup "Allegro assai"
  a'8^\partVi cis e
  h e, e'~
  e d h
  cis a'4~
  a8 gis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
