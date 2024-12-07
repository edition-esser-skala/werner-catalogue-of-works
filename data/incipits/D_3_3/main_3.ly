\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
    \set Staff.timeSignatureFraction = 2/2
  a'2.^\partSc a4 g2 a
  b1 a2 a
  d1. c2
  h1 a
}

text = \lyricmode {
  Vi -- ne -- a __ _
  me -- a e --
  le -- _
  _ cta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
