\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/4 \tempoMarkup "[no tempo]"
  f'4^\partUnk f16 b a b c8 es,
  d b r16 b' a b c8 es,
  d c r16 b a b c8 es,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
