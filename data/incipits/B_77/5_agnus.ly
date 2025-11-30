\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \tempoMarkup "ALla capella"
      \set Staff.timeSignatureFraction = 2/2
    d1 c
    b a2 a'
    g1 f2 a,
    b4 g b c d b d e
    f2 es d g~
    g f e a
  }
}

BassFigures = \figuremode {
  r1 <6>
  <#(dotbf 5)>2. <6>4 q2 q
  <5> <6>1 q2
  r1 q
  r2 q <7 _+> <_->
  <4\+ 2> <6> <7 _+>1
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
