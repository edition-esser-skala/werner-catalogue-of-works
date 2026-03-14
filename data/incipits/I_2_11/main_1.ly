\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key b \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  f4^\partAs b, b'~
  b a8[ g] f[ es]
  d4 b8 f' g4
  b8 f es2
  d r4
}

text = \lyricmode {
  A -- ve, a --
  ve Re --
  gi -- na, Re -- gi --
  na coe -- lo --
  rum,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
