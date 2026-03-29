\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 6/4 \tempoMarkup "Andante"
  a'4.^\partVi a8 a4 d b2
  a4 d, d' d c8 b c4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
