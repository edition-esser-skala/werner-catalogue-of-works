\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/4 \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  e'2.^\partVi
  g,4. c8 g f
  e4 g, h
  c4. c'8 g f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
