\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  g''4.^\partVi g8 c4
  h4. h8 c4
  a f g
  e4. fis8 gis4
  a2.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
