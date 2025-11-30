\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g8-\tutti g g g g g g g
    g g g g' d h g g'
    d d d d d r r4
    d8 g fis e d c h a
    g e c d g4 r
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r4 <6 5>8 <_+> r2
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
