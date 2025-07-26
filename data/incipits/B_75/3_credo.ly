\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Vivace"
    c'2-\tutti c, c'
    h1 g2
    c c, c'
    h1 g2
    c c c,
    f1 d2
    g1 e2
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  r
  <5>2 <6>1
  <5>2 <6>1
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
