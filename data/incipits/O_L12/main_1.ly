\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  \partial 4 d'4^\partUnk g, h'8. c16 a4. g8
  g1
  g4 g16 fis e d \grace d8 c4. c8
  h4. h8 cis4 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
