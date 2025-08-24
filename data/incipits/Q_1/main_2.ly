\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  b''8^\partVi r g r d r
  b r r4 r
  b8 r g r d r
  h r r4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
