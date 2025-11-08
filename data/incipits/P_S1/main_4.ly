\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/4 \tempoMarkup "Menuet"
  f'8.^\partVi b16 d,4 es
  f8. g16 a,4 b
  c8. d16 f,4 es
  d c8 d b4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
