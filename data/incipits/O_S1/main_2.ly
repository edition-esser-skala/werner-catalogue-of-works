\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "La Confusione"
  \partial 2 d'4.^\partVii h8
  e4 cis a16 h cis a
  d8 a \fC a'4.^\partVi fis8
  h4 gis e16 fis gis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
