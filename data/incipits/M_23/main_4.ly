\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Overette d’Amour"
  \partial 8 g''8^\partFl c c, c c
  c h r d16 es
  f8 f f f
  f e r g16 as
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
