\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'8^\partUnk a, a4 r
  f'8 a, a4 r
  gis'8 a, a4 r
  a'8 a, a4 r
  e'8 a, a4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
