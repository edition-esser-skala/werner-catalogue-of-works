\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
  e'2.^\partVi
  c'4 f, e
  h' e, dis
  \grace dis8 e2 r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
