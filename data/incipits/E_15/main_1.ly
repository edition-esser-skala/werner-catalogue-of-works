\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 4/4 \tempoMarkup "Larghetto"
  f,8^\partOrg f' f f f f f f
  c c c4 f r8 f
  e4 a8 f d f g g,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
