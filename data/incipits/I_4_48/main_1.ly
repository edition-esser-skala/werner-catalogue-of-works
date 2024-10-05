\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 2/4 \autoBeamOff \tempoMarkup "Ariose"
  b'4.^\partSs \tuplet 3/2 8 { c16[ b a] }
  b4 \tuplet 3/2 8 { b16[ c d] c[ b a]
  b[ c d] d[ es f] } \grace f8 es4\trill
  d
}

text = \lyricmode {
  Sal -- _
  _ _ _
  ve Re -- gi --
  na
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
