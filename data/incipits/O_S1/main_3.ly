\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \major \time 3/4 \tempoMarkup "Menuet"
  a'4^\partVi d d
  d8( cis) \appoggiatura cis4 e2
  e8( d) fis4 a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
