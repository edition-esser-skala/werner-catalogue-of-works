\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 4/4 \tempoMarkup "Allegro"
  r4^\partVi e'2 e,4
  c'8 h c4 a' d,~
  d d, h'8 a h4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
