\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Larghetto"
  a'2^\partVi d4
  a2 g8 a,
  f'4 g e
  d2 cis8 a'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
