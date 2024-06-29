\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro moderato"
  b''16^\partVi f d b d8 f
  b b, r f'
  f16( g) g( f) f( es) es d32 c
  d8 b r c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
