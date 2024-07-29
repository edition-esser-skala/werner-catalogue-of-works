\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "[no tempo]"
  g''2^\partUnk as~
  as4 g g2
  g as
  a b
  c4 r8 c, f2
  es d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
