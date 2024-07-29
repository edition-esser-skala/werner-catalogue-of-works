\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "[no tempo]"
  f'8^\partUnk c16 d c8 b a4 r8 c
  d16 f8 d16 b g'8 b,16 a g f e f4
  r2 r4 r8 g'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
