\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key c \major \time 2/4 \tempoMarkup "Spirituoso"
  c'16(^\partVi c,) c4 c'16( h)
  c( c,) c4 c'16( h)
  c h32 a g16. a32 g16 f32 e d16. g32
  e8 c r c'16(\p h)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
