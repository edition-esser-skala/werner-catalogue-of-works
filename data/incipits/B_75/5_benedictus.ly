\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo c16 h a8 d e c d h
    c a h gis a f' c d
    e c16 d e8 e, a c16 h a8 d
    e gis a e f d g? g,
    c h a e' f d g g,
  }
}

BassFigures = \figuremode {
  r2 <_+>8 <6> <9>4
  q q q <6>8 q
  <_+> <6> <6 4> <5 _+>2 <6>8
  r4. <6>8 <6 5>2
  r q4 <4>8 <3>
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
