\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key fis \minor \time 3/4 \tempoMarkup "Largo"
  cis'4^\partVi d e
  fis2 e4
  dis2.
  e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
