\version "2.24.2"
\include "header.ly"

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Larghetto"
      \once \override Staff.TimeSignature.style = #'single-digit
    e4-\solo g h
    e, r fis
    h, d e
    a, c d
    g, h d
    g, h g
    c2 e4
    a, c d
  }
}

BassFigures = \figuremode {
  r2 <6 4>8 <5 _+>
  r2 <_+>4
  q8 <_!> <6 _!> <5> <_+>4
  q8 <_!> <6> <5> <_+>4
  r2 <6 4>8 <5 _+>
  r2.
  <5>4 <6> <_+>
  r <6>8 <5>4.
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
