\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "Larghetto e sempre piano"
  d'2-\conSord^\partVi d16( g8.)
  es8( d) d4~ d16( b'8.) %110
  a16([ g8.) fis16( es!8.) d16( c8.)]
  \tuplet 3/2 4 { b8 a g } g4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
