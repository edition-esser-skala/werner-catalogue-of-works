\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \tempoMarkup "[unknown]" \autoBeamOff
  g'4^\partSc g c h
  r8 g f g g[ f] g4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
