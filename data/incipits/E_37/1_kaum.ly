\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Larghetto"
    r8 b' b, b' a16. b32 a16. g32 f16 es d c
    b8 d g b a, c f a
    g, b es g f b, f4
    b r8 b f' c a f
    b4 a g a8 f
    b4 g' a, f'
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <7>4 <4>8 <3>
  r2 r8 <\t>4.
  r2. <6>4
  r <5>8 <6!> <5> <6> <5> <6>
}

\score {
  <<
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
