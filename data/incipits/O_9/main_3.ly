\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \major \time 3/4 \tempoMarkup "[no tempo]"
  \tuplet 3/2 4 { cis'8^\partVi a dis } \hA \appoggiatura dis e2
  \tuplet 3/2 4 { h8 e, dis' } \hA \grace dis e2
  \tuplet 3/2 4 { a8 a, h } cis8.\trill h32 cis dis8.\trill cis32 \hA dis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
