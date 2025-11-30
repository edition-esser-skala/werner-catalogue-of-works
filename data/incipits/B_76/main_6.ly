\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "Adagio"
  g'1^\partOrg
  fis2~ fis
  g4. f8 e d c h
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
