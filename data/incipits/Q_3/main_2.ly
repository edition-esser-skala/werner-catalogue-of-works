\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Adagio"
  e'4.^\partFl c16 h a( gis) a8 r a
  h \tuplet 3/2 8 { h16 c d } c( d) h8 \appoggiatura d16 c h a8 r c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
