\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Vivace"
    c'2-\tutti g4
    e c r8 c
    g'4. g8 h g
    c4. c,8 e c
    f2 fis4
    g2 gis4
    a2 h4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  <9 5>4 <8 6>2
  <9 5>4 <8 6>2
  <9 5>4 <8 6> <6 5>
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
