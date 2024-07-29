\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
  g4^\partOrg b' g
  es' c, b'
  a f es'
  d b, a'
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
