\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 2/4 \tempoMarkup "Allegro"
  \partial 8 c''8^\partVi g e c g
  a4. g16 f
  g8 e r g'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
