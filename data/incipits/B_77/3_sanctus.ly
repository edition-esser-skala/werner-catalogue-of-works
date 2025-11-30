\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Vivace"
      \set Staff.timeSignatureFraction = 2/2
    << { s1 a' } \\ { d,1. c2 } >>
    f1 e
    d2 a4 b c1~
    c~ c~
    c~ c
    f r2 d~
  }
}

BassFigures = \figuremode {
  <1>\breve
  <3>2 <6> <7> <6>
  <3> <6> <6 4> <5 3>
  <8 3> <\t 6> <7 6> <\t 5>
  <6 5> <\t 4> <5 4> <\t 3>
  r1. <_+>2
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
