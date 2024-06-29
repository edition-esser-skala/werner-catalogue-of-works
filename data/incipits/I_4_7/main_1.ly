\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  d2^\partAs g4
  f es2\trill
  d r4
  R2.
  b2 d4
  c b2
  a4 c d
}

text = \lyricmode {
  Sal -- ve
  Re -- gi --
  na,

  sal -- ve
  Re -- gi --
  na, sal -- ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
