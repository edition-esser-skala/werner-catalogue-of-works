\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 2/2 \autoBeamOff \tempoMarkup "Andante"
  a'1^\partBc
  d,2 f
  b a
  g a
  f d %5
}

text = \lyricmode {
  Sal --
  ve, sal --
  _ _
  ve Re --
  gi -- na,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
