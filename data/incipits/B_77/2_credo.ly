\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "Passato moderato"
      \set Staff.timeSignatureFraction = 2/2
    d2. e4 f2 fis
    g1 d
    \clef soprano << { d''2 cis } \\ { e, a } >> \clef bass d,, g~
    g4 f d f e2 fis
    g d4 e f4. g8 a4 b
    c2 a4 f c1
  }
}

BassFigures = \figuremode {
  r\breve
  r1 <5 4>2 <\t 3>
  r1. <3>2
  <2>1 <7>4 <6> <3> <5>
  r\breve
  r1 <4>2 <3>
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
