\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 3/4 \tempoMarkup "Larghetto"
    \once \override Staff.TimeSignature.style = #'single-digit
  e4^\partOrg g h
  e, r fis
  h, d e
  a, c d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
