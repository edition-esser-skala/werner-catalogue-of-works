\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
  b'8^\partVi d f b
  f16 g f8 d f
  f es c a16 f
  d'8 b r f'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
