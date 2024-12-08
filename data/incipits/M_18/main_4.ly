\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \dorian \time 3/8 \tempoMarkup "Allegro"
  g'16^\partVii a b c a b
  g a b8 r
  a16 b c d b c
  a b c8 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
