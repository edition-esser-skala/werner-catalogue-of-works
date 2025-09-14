\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key a \major \time 2/2 \tempoMarkup "Allegro"
  a''4^\partVi a2 h8 cis
  h4 dis, e4. fis16 gis
  a4 fis cis dis
  e h e,2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
