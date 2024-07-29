\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "[no tempo]"
  r4^\partUnk a c
  r d f
  r g f
  r e g
  r a g
  r f e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
