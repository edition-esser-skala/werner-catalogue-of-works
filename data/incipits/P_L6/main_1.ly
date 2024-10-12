\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 2/4 \tempoMarkup "Allegro"
  c'4^\partVi e
  g16 f g8 r c
  h16 a h8 r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
