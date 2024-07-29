\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 4/4 \tempoMarkup "[no tempo]"
  c'4.^\partUnk c8 \tuplet 3/2 4 { f8 c a' f[ c e] }
  f4 f, r8 f a8. c16
  d4. d8 e4 f8. c16
  b4 b, r d'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
