\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key d \minor \time 2/4 \tempoMarkup "Un poco andante"
  d'8^\partVi a16 g f8 e
  f d r a''
  a16 g g8 r f,
  f16 e e8 r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
