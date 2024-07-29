\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 2/4 \tempoMarkup "[no tempo]"
  d'4.^\partUnk es8~
  es d16 c d8 g
  fis g a b16 a
  a8 d,, d'4
  d2
  d4 d,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
