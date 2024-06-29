\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Adagio"
    \once \override Staff.TimeSignature.style = #'single-digit
  g''8(^\partVi c,) c4 r8 r16 h
  c4 c, r8 r16 es'
  es8.[\trill d16 d8.\trill c16 c8.\trill b16]
  b2 r8 r16 es\p
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
