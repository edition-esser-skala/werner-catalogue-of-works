\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key c \major \time 2/2 \tempoMarkup "[no tempo]"
  g''4~^\part "cnto 1" g16 a g f e8 c d e
  f g16 a g8 f e4~ e16 f e d
  c8 e d c d2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
