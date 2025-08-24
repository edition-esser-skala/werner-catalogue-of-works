\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/4 \tempoMarkup "Andante mà non troppo"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'4.^\partVi g16( d) e8 c16( g)
  d'4. h16( g) c( a) fis( d)
  g( a) h( g) d'( h) g( d) c'( a) fis( d)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
