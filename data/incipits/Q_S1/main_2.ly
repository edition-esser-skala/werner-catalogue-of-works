\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Adagio"
  d'2.~^\partVi
  d4 cis8 h \hA cis a
  b2.~
  b4 a8 g a f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
