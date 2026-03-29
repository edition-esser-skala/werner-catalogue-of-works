\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \tempoMarkup "[unknown]" \autoBeamOff
  c'4.^\partSc c8 c4 c
  r c c c8 c
  b4. b8 a4 b~
  b a b2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
