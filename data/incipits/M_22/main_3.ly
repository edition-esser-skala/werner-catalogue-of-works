\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 3/4 \tempoMarkup "Adagio"
    \once \override Staff.TimeSignature.style = #'single-digit
  c'8(^\partVi es) b!4 \tuplet 3/2 4 { f8( g as) }
  as( g) g'4 f\trill
  e2 f8( g)
  c,4 as' g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
