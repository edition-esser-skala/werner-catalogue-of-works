\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Tempo giusto"
  r4^\partVi r e'
  dis8 h d d d c16 h
  c4 r a'
  gis8 e g g g fis16 e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
