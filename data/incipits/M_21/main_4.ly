\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 3/8 \tempoMarkup "Allegro"
  d'8.^\partVi e16 f g
  e8 a,16 h c! a
  d8 g,16 a b g
  cis a h cis d8 %90
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
