\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "[no tempo]"
  a''4.^\partVi g16( f) e4
  f8( d) \grace d cis2
  a4.\p g16( f) \tuplet 3/2 4 { e8 f g }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
