\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegro"
  \partial 8 c''8^\partVi c,16 c d d e e f f g g a a h h c c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
