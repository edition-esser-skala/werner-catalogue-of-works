\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro non troppo"
  d'16(^\partVi g) h4 c8
  d g,4 \tuplet 3/2 8 { a16 h c }
  h8 g, r c\p
  d g,4 \tuplet 3/2 8 { a16 h c }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
