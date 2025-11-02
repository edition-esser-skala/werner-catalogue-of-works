\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'4^\partSc d c
  c2.~
  c4 d e
  d2.
  c4 g' f
}

text = \lyricmode {
  Ky -- ri -- e
  e --
  _ _
  _
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
