\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro assai"
  r8 d^\partVi f d
  b' f d' b
  f'16 f f f f f f f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
