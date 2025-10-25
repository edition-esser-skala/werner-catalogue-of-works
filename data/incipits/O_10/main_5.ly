\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/8 \tempoMarkup "Allegro assai"
  b'16^\partVi b d d f f b b
  d d b b f f d d
  b b f f d d f f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
