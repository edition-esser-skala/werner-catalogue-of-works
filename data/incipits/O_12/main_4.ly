\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "Larghetto e sempre piano"
  c4.^\partVi c16 d d2
  e16 g b d e g b b, \grace b8 a2
  a16 c es fis a \hA fis \hA es c b2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
