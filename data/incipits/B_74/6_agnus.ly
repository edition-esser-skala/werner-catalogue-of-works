\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Largo"
    c1-\tutti c2
    c1 c2
    h1 h2
    c1 as'2
    fis1. %5
    g2 r r
    R1.
    a,4 a' a a a a
    d, d d d d d
  }
}

BassFigures = \figuremode {
  r1.
  <6 4>
  <6 5>
  <9 _->2 <8>1
  <7- 5>1. %5
  r
  r
  r
  <6->
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
