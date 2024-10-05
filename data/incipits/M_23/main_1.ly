\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 2/4 \tempoMarkup "Andante"
  g''4~^\partFl g16 es d c
  \grace c8 h4 c
  d8 es16 f \grace f16 es8 d16 c
  h d g,8 r g16 a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
