\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Allegro"
  r16^\partVi b'' b b b b b b f4 es
  d8 f g f r es f es
  d16 b b b b b b b f4 es
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
