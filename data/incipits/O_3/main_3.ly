\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
  d'2^\partVi \tuplet 3/2 4 { es8 d c }
  \grace c b2 a4
  d,16([ fis8.) a16( c8.)] \tuplet 3/2 4 { es8 d c }
  \grace c b2 a4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
