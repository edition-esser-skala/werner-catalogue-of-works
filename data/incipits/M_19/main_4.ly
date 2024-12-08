\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \dorian \time 3/4 \tempoMarkup "Vivace"
  \override Staff.TimeSignature.style = #'single-digit
    c'4^\partVii des4. c16 b
  c8 e, f c' des c16 b
  c8 e, f b as16 f g e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
