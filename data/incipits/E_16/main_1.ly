\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  b'2^\partBs a8[ g]
  f2 g4
  a2 b4
  c8[ f,] f4 r
}

text = \lyricmode {
  Schön -- ſte
  Jung -- frau
  un -- ter
  al -- len
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
