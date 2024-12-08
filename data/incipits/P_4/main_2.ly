\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Larghetto"
  a'16(\p^\partVi e') e8 r16 f e d c( h) a8 r16 f' e d
  c( h) a( h) c8.\trill c16 \grace c8 h4 r16 h c d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
