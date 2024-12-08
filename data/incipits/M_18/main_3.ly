\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \dorian \time 3/4 \tempoMarkup "Largo"
  d'4^\partVi es r8 es
  es( cis) d4 r
  a' b r8 b
  b( a) a4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
