\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/8 \tempoMarkup "Allegro assai"
  g''4.^\partVi
  a8( h c)
  c( h a)
  g4.~
  g8 a d,~
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
