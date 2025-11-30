\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/2 \tempoMarkup "Andante"
    g2-\solo g' fis
    e1 h2
    c d d,
    g1 r2
    R1.
    r2 r4 d'-\solo e fis
    g2 c,1
    d2 r r
  }
}

BassFigures = \figuremode {
  r1.
  r
  r2 <6 4> <5 _+>
  r1.
  r
  r1 <6>2
  r <5> <6>
  r1.
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
