\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
  \partial 4 a'4~^\partVi
  a c8 d e4~
  e a8 h c4
  h a gis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
