\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "[no tempo]"
  r4^\partUnk a' f
  r d b'
  r a, e''
  r d, f'
  r g b,
  r f' a
  r c es,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
