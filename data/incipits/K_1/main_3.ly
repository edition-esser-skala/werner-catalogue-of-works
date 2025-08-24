\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Presto"
  d'1^\partSic
  c
  b2 c
  b r
}

text = \lyricmode {
  Io --
  _
  _ _
  d.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
