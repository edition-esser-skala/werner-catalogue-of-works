\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Spirituoso"
    a'8-\solo c gis e a, a'16. e32 c8 a
    d f g h, c c' h g
    c c,\p h g c c'\f e, c
    f d g g, c8. c16 g'8 gis
    a a, d, d' e4 r16 e gis e
  }
}

BassFigures = \figuremode {
  r1
  <9>8 <6> <9> <6>16 <5> <9 4> <8 3> <6>8 q4
  r8 q q2.
  r4 <6 4>8 <5 3>4. <6 4>8 <5 3>
  <9 4> <8 3> <9 7> <8 6>16 <_ 5> <_+>4 r16 <7 _+>8.
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
