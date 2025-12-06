\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Molto allegro"
  f'32^\partVi e f8. a32 g a8.
  f4. e16 d
  c8 b a b
  c b a4
  c8 b a b
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
