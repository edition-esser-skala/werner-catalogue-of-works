\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 4/4 \tempoMarkup "[no tempo]"
  d'2^\partVii h
  e cis
  fis e4 d~
  d cis d8 cis fis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
