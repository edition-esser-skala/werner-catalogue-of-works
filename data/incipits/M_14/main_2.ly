\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Presto"
  a''2^\partVi f4 e8 d
  cis4 b!8 a b2 %20
  a8 d d d cis c c c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
