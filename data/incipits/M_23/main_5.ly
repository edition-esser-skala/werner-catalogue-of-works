\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Menuet"
    \once \override Staff.TimeSignature.style = #'single-digit
  g''4^\partFl c, h
  c g r
  g es d
  es d r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
