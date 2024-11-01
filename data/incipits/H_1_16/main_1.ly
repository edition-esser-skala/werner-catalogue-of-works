\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
  d'2^\partSc d d4 d
  d2 d d
  d4 d8 d d2. d4
  d2 d2. d4
}

text = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem, Do -- mi --
  num, lau -- da,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
