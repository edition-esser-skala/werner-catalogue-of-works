\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Ariose"
    \once \override Staff.TimeSignature.style = #'single-digit
  g'2.~^\partAs
  g4 f8[ e] d[ c]
  c4 d c8[ d]
  h4 c r
}

text = \lyricmode {
  Sal --
  ve Re --
  gi -- _ na,
  sal -- ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
