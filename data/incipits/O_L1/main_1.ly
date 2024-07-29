\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 2/2 \tempoMarkup "[no tempo]"
  \partial 8*3 c'8^\partUnk g8. a16
    e4. f8 g8. c16 a8. c,16
  h2 r8 d g8. f16
  e8. g16 c8. h16 a8. f'16 d8. h16
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
