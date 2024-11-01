\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \major \time 4/4 \tempoMarkup "Allegro"
  d8^\partOrg d cis cis h16 g' fis e fis8 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
