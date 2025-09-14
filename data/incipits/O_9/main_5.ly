\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 12/8 \tempoMarkup "Spirituoso"
  cis'16^\partVi h cis d cis8 e16 d e fis e8 a4.~ a8 h cis
  d16 cis h8 a gis16 fis e8 d \grace d8 cis4. r4 r8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
