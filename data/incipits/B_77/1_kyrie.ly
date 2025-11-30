\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    d2. e4 f2 d
    r g1 f2
    e f c d
    a1 b4 c d e
    f e d c b a g f
    c'1 f,
  }
}

BassFigures = \figuremode {
  r\breve
  r2 <3> <2> <6>
  <6 4>4 <_ 3> r1.
  <6 4>2 <5 3> <9> <6>
  <9> <3>1.
  <4>2 <3>1.
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
