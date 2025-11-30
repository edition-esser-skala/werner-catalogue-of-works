\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'8-\tutti h fis d g4 r
    r8 c h a g4 r
    r8 c h a g4. fis8
    g d h g d'4 r8 d-\tasto
    g d h g d'4 r8 d\f
    a' e cis a d4. c8
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  <4>8 <6\\>4. <9>8 <8>4 <\t>8
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
