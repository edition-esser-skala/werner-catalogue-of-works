\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 3/4 \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  a'4^\partVi a r8 r16 d
  g,4 g r
  g g r8 r16 a
  fis4 fis r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
