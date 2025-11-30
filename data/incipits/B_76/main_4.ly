\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "Molto andante"
  g'4.^\partOrg fis8 g4 e
  d2 e4. d16 c
  h4 c d e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
