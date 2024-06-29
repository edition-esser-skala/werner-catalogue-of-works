\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \dorian \time 3/4 \tempoMarkup "Adagio"
    \override Staff.TimeSignature.style = #'single-digit
  f4^\partVii g a
  b c des8( e,)
  f( b) as!4 g\trill
  \set Staff.forceClef = ##t c4^\partVi d! e
  f g as8( h,)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
