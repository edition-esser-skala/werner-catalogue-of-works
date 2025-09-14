\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \tempoMarkup "Ariose" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  e2^\partSs a4
  gis2 a4
  d e cis
  h2 cis4
  d cis8[ h] cis4 %5
}

text = \lyricmode {
  Ky -- ri --
  e e --
  lei -- _ son,
  Ky -- ri --
  e __ _ "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
