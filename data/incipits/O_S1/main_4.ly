\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key d \major \time 2/2 \tempoMarkup "Allabreve"
  \partial 2 d'2~^\partVii
  d cis4 h
  a h cis d
  e fis g2~
  g fis4 e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
