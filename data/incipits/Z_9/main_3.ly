\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Adagio ma poco"
  r8^\partVi g'' es( d) r g, es( d)
  r g es' c as4~ as16 f' d as
  g4 es' d2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
