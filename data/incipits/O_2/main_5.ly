\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/8 \tempoMarkup "Allegro"
  \afterGrace d'2^\partVi { d16( cis h) }
  \afterGrace a2 { g16( fis e) }
  d16 e fis d a8 g'
  fis d r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
