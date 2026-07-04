\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Vivace"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'4^\partVi d, fis'
  d d, fis'
  d cis8 h a g
  fis4 a' a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
