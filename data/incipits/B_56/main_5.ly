\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  c2^\part "trb 1" f d
  c c2^\partAs d
  c a c
  f1.~
  f2 g f %5
}

text = \lyricmode {
  \skips 4
  Be -- ne --
  di -- ctus, qui
  ve --
  nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
