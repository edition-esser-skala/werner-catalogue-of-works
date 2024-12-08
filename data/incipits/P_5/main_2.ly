\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "Largo"
  b'2.~^\partVi
  b4 a \tuplet 3/2 4 { c8 d es }
  d2.~
  d4 c b'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
