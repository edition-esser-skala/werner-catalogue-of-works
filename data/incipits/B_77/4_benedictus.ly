\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 2/2 \tempoMarkup "Larghetto"
    f4-\solo-\tasto a g f
    e d c b
    a f b2
    c4 g' c b
    a8 b a4 g f
    e d c b
    a f b2
    c4 c' e, c
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <6>4 <5>
  r1
  r
  r
  r2 <6>4 <5>
  r1
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
