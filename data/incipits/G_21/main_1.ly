\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Allegretto"
    \once \override Staff.TimeSignature.style = #'single-digit
  d'4^\partSc e4. e8
  cis4 d2
  h4 cis e
  a, h d
  g, r r
}

text = \lyricmode {
  Ky -- _ ri --
  e e --
  lei -- _ _
  son, Chri -- _
  ste,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
