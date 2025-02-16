\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Andante cantabile"
    \once \override Staff.TimeSignature.style = #'single-digit
    r4^\partFl g'' c~
    c h8 as g f
    es4 c r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
