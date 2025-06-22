\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/8 \tempoMarkup "Allegro passato"
  d''4^\partVi \tuplet 3/2 8 { d16 cis h }
  a4 \tuplet 3/2 8 { h16 a g }
  a8 fis e
  fis d r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
