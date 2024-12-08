\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Vivace"
  r8 c'^\partVi c c es d16 c h8 c
  fis( g) r c,\p es d16 c h8 c
  fis( g) r e\f f d es c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
