\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "[unknown]" \autoBeamOff
  a'4^\partSc r r8 a a a
  a4 r r8 a a a
  a4 r r2
  d,4 r r2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
