\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
  e'2.~^\partVi
  e8 c a4 a'
  \grace a8 gis2 r4
  e,8 a e'4 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
