\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \minor \time 4/4 \tempoMarkup "[no tempo]"
  \partial 8 g''16^\partUnk as h,8 c d16 es f es d8 h r c
  c16 des des8 r e e16 f f8 r g
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
