\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/8 \tempoMarkup "Allegretto"
  d'4.^\partVi
  f32( e d cis) d4
  f32( e d cis) d4
  e32( f g f) g8[ a]
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
