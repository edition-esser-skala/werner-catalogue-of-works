\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key g \major \time 2/4 \tempoMarkup "Andante passato"
  g'32(^\partVi d'16.) c32( d16.) h32( c16.) a32( h16.)
  g32( d'16.) c32( d16.) h32( c16.) a32( h16.)
  g32( d'16.) c32( d16.) h32( c16.) a32( h16.)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
