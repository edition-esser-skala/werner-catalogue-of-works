\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \dorian \time 2/2 \tempoMarkup "[unknown]" \autoBeamOff
  c8^\partAc c16 d es8 f g4. f8
  g4 g r2
  r8 g16 f g8 es d4 d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
