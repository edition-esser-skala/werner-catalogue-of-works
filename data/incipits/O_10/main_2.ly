\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 12/16 \tempoMarkup "[no tempo]"
  d'16^\partVi f d b8. f16 b f d8.
  d'16 f d b d b f b f d8.
  b16 b b d d d f f f b8.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
