\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Larghetto"
    c2.~-\tutti
    c4 h2
    c2.
    g2 r4
    R2.
    dis'8\p dis dis dis dis dis
    e2 r4
  }
}

BassFigures = \figuremode {
  r2 <6 4>4
  <4 2> <6>2
  <9>4 <8> <6 4\+>
  r2.
  r
  <7 5>
  <_+>
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
