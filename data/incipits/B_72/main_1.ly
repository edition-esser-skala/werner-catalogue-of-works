\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 3/2 \tempoMarkup "[unknown]" \autoBeamOff
  c'2.^\partSc c4 h2
  c2. c4 c2
  R1.*6
  b2. b4 b2
  b2. b4 b2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
