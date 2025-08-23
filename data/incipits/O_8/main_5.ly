\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "[no tempo]"
  f'4.^\partVi e16( d) c4
  c16( d8.) d16( c8.) c16( b8.)
  b4\trill a r
  g16( a b c) d8( b) g( f)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
