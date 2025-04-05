\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Allegretto"
  d'4.^\partVi a'16 fis h g e cis
  d8 a16 d, h' d, a' d, h' d, cis' d,
  d'4. a'16 fis h g e cis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
