\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "[no tempo]"
  e'4.^\partVi e8 e4 f
  e a, d c8 h
  c d e4. f8 g a
  d,4 e2 d4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
