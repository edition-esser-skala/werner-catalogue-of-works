\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/4 \autoBeamOff \tempoMarkup "Ariose"
    \once \override Staff.TimeSignature.style = #'single-digit
  cis'8[^\partSs d] e4 h
  a8[ gis] a4 r
  e' d cis8[ h]
  cis[ h] cis4 r
}

text = \lyricmode {
  Sal -- _ ve,
  sal -- ve,
  Re -- gi -- na
  sal -- ve,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
