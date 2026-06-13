\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/4 \tempoMarkup "Vivace" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  f4^\partSc a c
  a f c'
  f c a
  f r r
}

text = \lyricmode {
  Tau -- et ihr
  Him -- mel und
  trief -- fet he --
  rab
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
