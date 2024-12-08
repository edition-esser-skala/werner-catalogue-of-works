\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/8 \tempoMarkup "Allegro ma non troppo"
  b'4.~^\partVi
  b8 a b
  c16 d es4~
  es8 d es
  f16( d b8) as
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
