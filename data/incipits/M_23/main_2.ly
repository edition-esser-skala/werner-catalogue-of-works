\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Courente"
    \once \override Staff.TimeSignature.style = #'single-digit
  \partial 8 g''8^\partFl g4. f8 es d
  c d g, c d h
  c4 g8 c c8.\trill h32 c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
