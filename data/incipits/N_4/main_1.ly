\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Andante moderato"
    \once \override Staff.TimeSignature.style = #'single-digit
  d4.^\partVi e16 d fis d g e
  fis4. g16 fis a fis h g
  a fis h g a fis a d h g' e cis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
