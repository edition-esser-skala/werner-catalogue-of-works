\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c4 d e c h g
    c d e c h g
    c d e c h c
    g4. a8 h4 a h g
    c4. h8 a4 c8 h a4 c %5
    d4. c8 h4 d8 c h4 d
  }
}

BassFigures = \figuremode {
  r2. <6>4 q2
  r2. q4 q2
  r1.
  r
  r1 r4 <6>
  <_+>2. q2 <6>4
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
