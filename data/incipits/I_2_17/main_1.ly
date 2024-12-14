\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
  f1^\partSc
  e2 d
  e c
  d e
  f1
}

text = \lyricmode {
  A --
  _ _
  _ _
  _ _
  ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
