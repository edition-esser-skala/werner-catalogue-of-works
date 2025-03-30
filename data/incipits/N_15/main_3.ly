\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 3/8 \tempoMarkup "Allegro"
  g'8^\partVi g' g
  g fis e
  d4 e16 cis
  d4.
  d,8 c'! c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
